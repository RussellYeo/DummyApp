//
//  Product.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import Foundation

struct Product {
    let id: Int
    let title: String
    let description: String
    let price: Decimal
    let discountPercentage: Decimal
    let rating: Decimal
    let stock: UInt
    let brand: String
    let category: String
    let thumbnail: String
    let images: Array<String>
}
