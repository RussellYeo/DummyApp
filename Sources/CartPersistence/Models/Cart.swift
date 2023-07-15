//
//  Cart.swift
//  DummyAPI
//
//  Created by Russell Yeo on 13/05/2023.
//

import Combine
import Foundation

public struct Cart {
    public let items: [CartItem]
    public let totalPrice: Decimal
    public let totalProducts: UInt
    public let totalQuantity: UInt
    
    public init(
        items: [CartItem],
        totalPrice: Decimal,
        totalProducts: UInt,
        totalQuantity: UInt
    ) {
        self.items = items
        self.totalPrice = totalPrice
        self.totalProducts = totalProducts
        self.totalQuantity = totalQuantity
    }
}
