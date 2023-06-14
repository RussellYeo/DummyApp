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
    var cartPublisher: AnyPublisher<Cart, Never>
    /// Add a product to the cart
    var addToCart: (_ product: Product) -> ()
    /// Get the quantity of a product in the cart. Returns nil if the item does not exist in the cart.
    var getQuantity: (_ product: Product) -> UInt?
    /// Update the quantity of a product in the cart
    var updateQuantity: (_ product: Product, _ quantity: UInt) -> Bool
}
