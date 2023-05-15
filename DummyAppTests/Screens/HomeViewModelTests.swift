//
//  HomeViewModelTests.swift
//  DummyAppTests
//
//  Created by Russell Yeo on 15/05/2023.
//

import Combine
@testable import DummyApp
import XCTest

class HomeViewModelTests: XCTestCase {

    var productsProvider: ProductsProviderMock!
    var viewModel: HomeViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        productsProvider = ProductsProviderMock()
        viewModel = HomeViewModel(productsProvider: productsProvider)
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        productsProvider = nil
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testFetchFirstPage() {
        // GIVEN some products will be returned by the provider
        let products = [
            ProductDTO.iPhoneX,
            ProductDTO.iPhone9,
            ProductDTO.samsungUniverse
        ]
        let page = ProductsPage(products: products, total: 10, skip: 0, limit: 3)
        productsProvider.getProductsReturnValue = Just(page)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
        
        let expectation = XCTestExpectation(description: "Products were updated")
        viewModel.$products
            .dropFirst()
            .sink { result in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // WHEN we fetch the first page
        viewModel.fetchFirstPage()
        
        // THEN the ViewModel successfully receives some products
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(viewModel.products.count, 3)
        XCTAssertNil(viewModel.error)
    }

}
