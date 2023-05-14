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
    
    var productsPublisher: AnyPublisher<[CartProduct], Never> {
        Just(products)
            .setFailureType(to: Never.self)
            .eraseToAnyPublisher()
    }
    
    var totalPricePublisher: AnyPublisher<Decimal, Never> {
        Just(products.map(\.product).map(\.price).reduce(0, +))
            .setFailureType(to: Never.self)
            .eraseToAnyPublisher()
    }
    
    var totalQuantityPublisher: AnyPublisher<UInt, Never> {
        Just(UInt(products.map(\.quantity).reduce(0, +)))
            .setFailureType(to: Never.self)
            .eraseToAnyPublisher()
    }
    
    var totalProductsPublisher: AnyPublisher<UInt, Never> {
        Just(UInt(products.count))
            .setFailureType(to: Never.self)
            .eraseToAnyPublisher()
    }
    
    func addToCart(_ product: Product) {
        //
    }
}
