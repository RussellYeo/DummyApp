//
//  CartProvider.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import Combine
import Foundation

protocol CartProvider {
    /// Publishes an array of CartProduct objects
    var productsPublisher: AnyPublisher<[CartProduct], Never> { get }
    /// Publishes the total price of the Cart
    var totalPricePublisher: AnyPublisher<Decimal, Never> { get }
    /// Publishes the total quantity of products added to the Cart
    var totalQuantityPublisher: AnyPublisher<UInt, Never> { get }
    /// Publishes the total number of products added to the Cart
    var totalProductsPublisher: AnyPublisher<UInt, Never> { get }
    /// Add a product to the cart
    func addToCart(_ product: Product)
}

final class CartProviderImpl: CartProvider {
    @Published private var cart: Cart = .init()
    
    var productsPublisher: AnyPublisher<[CartProduct], Never> {
        $cart
            .map(\.products)
            .map { (products) in
                products.map { (product, quantity) in
                    CartProduct(product: product, quantity: quantity)
                }
            }
            .eraseToAnyPublisher()
    }
    
    var totalPricePublisher: AnyPublisher<Decimal, Never> {
        $cart.map(\.totalPrice).eraseToAnyPublisher()
    }
    
    var totalQuantityPublisher: AnyPublisher<UInt, Never> {
        $cart.map(\.totalQuantity).eraseToAnyPublisher()
    }
    
    var totalProductsPublisher: AnyPublisher<UInt, Never> {
        $cart.map(\.totalProducts).eraseToAnyPublisher()
    }
    
    func addToCart(_ product: Product) {
        cart.add(product: product)
    }
    
}
