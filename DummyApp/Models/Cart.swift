//
//  Cart.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import Combine
import Foundation

struct Cart {
    let products: [CartProduct]
    let totalPrice: Decimal
    let totalProducts: UInt
    let totalQuantity: UInt
}
