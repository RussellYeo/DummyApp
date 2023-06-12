//
//  CartClientPreview.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import Combine
import Foundation

extension CartClient {
    static var preview: Self {
        let products: [CartProduct] = [
            CartProduct(product: ProductDTO.iPhoneX.model, quantity: 2),
            CartProduct(product: ProductDTO.samsungUniverse.model, quantity: 1)
        ]
        let _cart = Cart(
            products: products,
            totalPrice: products.map(\.product).map(\.price).reduce(0, +),
            totalProducts: UInt(products.count),
            totalQuantity: products.map(\.quantity).reduce(0, +)
        )
        return Self(
            cart: {
                Just(_cart)
                    .setFailureType(to: Never.self)
                    .eraseToAnyPublisher()
                
            },
            addToCart: { (_) in },
            updateQuantity: { (_,_) in true }
        )
    }
}
