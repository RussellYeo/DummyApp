//
//  CartItem.swift
//  DummyAPI
//
//  Created by Russell Yeo on 14/05/2023.
//

import Foundation

public struct CartItem: Equatable {
    public var product: Product
    public var quantity: UInt
    
    public init(product: Product, quantity: UInt) {
        self.product = product
        self.quantity = quantity
    }
}

extension CartItem: Identifiable {
    public var id: Int {
        return product.id
    }
}
