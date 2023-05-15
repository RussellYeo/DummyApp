//
//  CartProviderPreviewSupport.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import Combine
import Foundation

final class CartProviderPreviewSupport: CartProvider {
    private let products: [CartProduct] = [
        CartProduct(product: ProductDTO.iPhoneX.model, quantity: 2),
        CartProduct(product: ProductDTO.samsungUniverse.model, quantity: 1)
    ]
    
    private var cart: Cart {
        Cart(
            products: products,
            totalPrice: products.map(\.product).map(\.price).reduce(0, +),
            totalProducts: UInt(products.count),
            totalQuantity: products.map(\.quantity).reduce(0, +)
        )
    }
    
    var cartPublisher: AnyPublisher<Cart, Never> {
        Just(cart)
            .setFailureType(to: Never.self)
            .eraseToAnyPublisher()
    }
    
    func addToCart(_ product: Product) {
        //
    }
}
