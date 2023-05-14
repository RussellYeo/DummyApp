//
//  CartProduct.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import Foundation

struct CartProduct {
    let product: Product
    let quantity: UInt
}

extension CartProduct: Identifiable {
    var id: Int {
        return product.id
    }
}
