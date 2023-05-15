//
//  CartProvider.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import Combine
import Foundation

protocol CartProvider {
    /// Emits changes to the Cart
    var cartPublisher: AnyPublisher<Cart, Never> { get }
    /// Add a product to the cart
    func addToCart(_ product: Product)
}

final class CartProviderImpl: CartProvider {
    @Published private var cart: CartStorage = .init()
    
    var cartPublisher: AnyPublisher<Cart, Never> {
        $cart
            .map { (cart) in
                let products = cart.products.map { (product, quantity) in
                    CartProduct(product: product, quantity: quantity)
                }
                return Cart(
                    products: products,
                    totalPrice: cart.totalPrice,
                    totalProducts: cart.totalProducts,
                    totalQuantity: cart.totalQuantity
                )
            }
            .eraseToAnyPublisher()
    }
    
    func addToCart(_ product: Product) {
        cart.add(product: product)
    }
    
}
