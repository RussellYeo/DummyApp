//
//  Cart.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import Combine
import Foundation

final class Cart {
    @Published var products: [Product: UInt] = [:]
    @Published var totalPrice: Decimal = 0.0
    @Published var totalProducts: Int = 0
    @Published var totalQuantity: UInt = 0
    
    func add(product: Product) {
        if let existingProductQuantity = products[product] {
            products[product] = existingProductQuantity + 1
        } else {
            products[product] = 1
            totalProducts += 1
        }
        totalPrice += product.price
        totalQuantity += 1
    }
}
