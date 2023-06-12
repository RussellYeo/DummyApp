//
//  CartViewModelTests.swift
//  DummyAppTests
//
//  Created by Russell Yeo on 15/05/2023.
//

import Combine
import Dependencies
@testable import DummyApp
import XCTest

class CartViewModelTests: XCTestCase {
    
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testReload() {
        // GIVEN a Cart with two products
        let viewModel = withDependencies {
            $0.cartClient.cart = {
                let cart = Cart(
                    products: [
                        CartProduct(product: ProductDTO.iPhoneX.model, quantity: 2),
                        CartProduct(product: ProductDTO.iPhone9.model, quantity: 1)
                    ],
                    totalPrice: 2347,
                    totalProducts: 2,
                    totalQuantity: 3
                )
                return Just(cart)
                    .setFailureType(to: Never.self)
                    .eraseToAnyPublisher()
            }
            $0.numberFormatter = .USD
        } operation: {
            CartViewModel()
        }
        
        // AND the price will be updated
        let expectation = XCTestExpectation(description: "Total price was updated")
        viewModel.$totalPrice
            .dropFirst()
            .sink { result in
                expectation.fulfill()
            }
            .store(in: &cancellables)

        // WHEN we reload the ViewModel
        viewModel.reload()
        
        wait(for: [expectation], timeout: 1.0)
        
        // THEN
        XCTAssertEqual(viewModel.isEmptyState, false)
        XCTAssertEqual(viewModel.products.count, 2)
        XCTAssertEqual(viewModel.totalPrice, "$2,347.00")
        XCTAssertEqual(viewModel.totalQuantity, 3)
    }
    
}
