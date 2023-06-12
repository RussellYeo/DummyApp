//
//  HomeViewModelTests.swift
//  DummyAppTests
//
//  Created by Russell Yeo on 15/05/2023.
//

import Combine
import Dependencies
@testable import DummyApp
import XCTest

class HomeViewModelTests: XCTestCase {

    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testFetchFirstPage() {
        // GIVEN some products will be returned by the products client
        let viewModel = withDependencies {
            $0.productsClient.getProducts = { (_, _) in
                let products = [
                    ProductDTO.iPhoneX,
                    ProductDTO.iPhone9,
                    ProductDTO.samsungUniverse
                ]
                let page = ProductsPage(products: products, total: 10, skip: 0, limit: 3)
                return Just(page)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            }
        } operation: {
            HomeViewModel()
        }
        
        // AND the products will be updated
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
