//
//  ProductsProviderTests.swift
//  DummyAppTests
//
//  Created by Russell Yeo on 13/05/2023.
//

import Combine
@testable import DummyApp
import XCTest

final class ProductsProviderTests: XCTestCase {
    private var httpClient: HTTPClientMock<ProductsPage>!
    private var productsProvider: ProductsProvider!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        httpClient = HTTPClientMock()
        productsProvider = ProductsProviderImpl(httpClient: httpClient)
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        httpClient = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testGetProducts() {
        // GIVEN the provider will return a page of products
        let page = ProductsPage(
            products: [
                .iPhone9,
                .iPhoneX,
                .samsungUniverse
            ],
            total: 10,
            skip: 0,
            limit: 3
        )
        httpClient.fetchResponse = Just(page)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
        
        // WHEN we get a page of products
        let expectation = XCTestExpectation(description: "Fetch products page")
        var result: ProductsPage?
        productsProvider.getProducts()
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        XCTFail("Error: \(error)")
                    case .finished:
                        expectation.fulfill()
                    }
                },
                receiveValue: { page in
                    result = page
                }
            )
            .store(in: &cancellables)
        
        // THEN the page is returned
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(result?.products.count, 3)
        XCTAssertEqual(result?.total, 10)
        XCTAssertEqual(result?.skip, 0)
        XCTAssertEqual(result?.limit, 3)
    }
    
}
