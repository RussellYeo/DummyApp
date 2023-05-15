//
//  CartViewModelTests.swift
//  DummyAppTests
//
//  Created by Russell Yeo on 15/05/2023.
//

import Combine
@testable import DummyApp
import XCTest

class CartViewModelTests: XCTestCase {
    
    var cartProvider: CartProviderMock!
    var viewModel: CartViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cartProvider = CartProviderMock()
        viewModel = CartViewModel(cartProvider: cartProvider)
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        cartProvider = nil
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testReload() {
        // GIVEN a Cart with two products
        let cart = Cart(
            products: [
                CartProduct(product: ProductDTO.iPhoneX.model, quantity: 2),
                CartProduct(product: ProductDTO.iPhone9.model, quantity: 1)
            ],
            totalPrice: 2347,
            totalProducts: 2,
            totalQuantity: 3
        )
        cartProvider.cartPublisher = Just(cart).eraseToAnyPublisher()
        
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
