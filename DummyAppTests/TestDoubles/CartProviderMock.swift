//
//  CartProviderMock.swift
//  DummyAppTests
//
//  Created by Russell Yeo on 15/05/2023.
//

import Combine
import Foundation
@testable import DummyApp

final class CartProviderMock: CartProvider {
    
    var cartPublisher: AnyPublisher<Cart, Never> = Empty().eraseToAnyPublisher()
    
    // MARK: addToCart
    
    var addToCartCalls = 0
    var addToCartCalledCount: Bool {
        addToCartCalls > 0
    }
    var addToCartReceivedInvocations: [Product] = []
    
    func addToCart(_ product: Product) {
        addToCartCalls += 1
        addToCartReceivedInvocations.append(product)
    }
    
    // MARK: updateQuantity
    
    var updateQuantityCalls = 0
    var updateQuantityCalledCount: Bool {
        updateQuantityCalls > 0
    }
    var updateQuantityReceivedInvocations: [(product: Product, quantity: UInt)] = []
    
    func updateQuantity(product: Product, quantity: UInt) {
        updateQuantityReceivedInvocations.append((product, quantity))
    }
}

