//
//  CartClientLive.swift
//  DummyApp
//
//  Created by Russell Yeo on 12/06/2023.
//

import Combine
import Foundation

extension CartClient {
    static var live: Self {
        let storage = CurrentValueSubject<CartStorage, Never>(.init())
        
        return Self(
            cart: {
                storage
                    .map { (cart) in
                        Cart(
                            products: cart.products.map(CartProduct.init),
                            totalPrice: cart.totalPrice,
                            totalProducts: cart.totalProducts,
                            totalQuantity: cart.totalQuantity
                        )
                    }
                    .eraseToAnyPublisher()
            },
            addToCart: { (product) in
                storage.value.add(product: product)
            },
            updateQuantity: { (product, quantity) in
                storage.value.update(product: product, quantity: quantity)
            }
        )
    }
}
