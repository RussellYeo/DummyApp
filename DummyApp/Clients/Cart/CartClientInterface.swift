//
//  CartClientInterface.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import Combine
import Foundation

struct CartClient {
    /// Emits updates to the cart
    var cart: () -> AnyPublisher<Cart, Never>
    /// Add a product to the cart
    var addToCart: (Product) -> ()
    /// Update the quantity of a product in the cart
    var updateQuantity: (Product, UInt) -> Bool
}
