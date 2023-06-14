//
//  CartItem.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import Foundation

struct CartItem: Equatable {
    var product: Product
    var quantity: UInt
}

extension CartItem: Identifiable {
    var id: Int {
        return product.id
    }
}
