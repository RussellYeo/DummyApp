//
//  CartClientInterface.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import Combine
import Foundation

public struct CartClient {
    /// Emits updates to the cart
    public var cartPublisher: AnyPublisher<Cart, Never>
    /// Add a product to the cart
    public var addToCart: (_ product: Product) -> ()
    /// Get the quantity of a product in the cart. Returns nil if the item does not exist in the cart.
    public var getQuantity: (_ product: Product) -> UInt?
    /// Update the quantity of a product in the cart
    public var updateQuantity: (_ product: Product, _ quantity: UInt) -> Bool
    
    /// Initialise a CartClient
    public init(
        cartPublisher: AnyPublisher<Cart, Never>,
        addToCart: @escaping (_: Product) -> Void,
        getQuantity: @escaping (_: Product) -> UInt?,
        updateQuantity: @escaping (_: Product, _: UInt) -> Bool
    ) {
        self.cartPublisher = cartPublisher
        self.addToCart = addToCart
        self.getQuantity = getQuantity
        self.updateQuantity = updateQuantity
    }
}
