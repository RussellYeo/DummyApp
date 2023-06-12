//
//  CartStorage.swift
//  DummyApp
//
//  Created by Russell Yeo on 15/05/2023.
//

import Combine
import Dependencies
import Foundation

final class CartStorage: ObservableObject {
    var products: [Product: UInt] = [:]
    var totalPrice: Decimal = 0.0
    var totalProducts: UInt = 0
    var totalQuantity: UInt = 0
    
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
    
    func update(product: Product, quantity: UInt) -> Bool {
        guard
            products[product] != nil,
            products[product] != quantity
        else {
            return false
        }
        products[product] = quantity
        totalPrice += product.price
        totalQuantity += 1
        return true
    }
}

private enum CartStorageKey: DependencyKey {
    static let liveValue = CartStorage()
}

extension DependencyValues {
    var cartStorage: CartStorage {
        get { self[CartStorageKey.self] }
        set { self[CartStorageKey.self] = newValue }
    }
}
