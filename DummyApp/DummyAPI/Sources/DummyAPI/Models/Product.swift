//
//  Product.swift
//  DummyAPI
//
//  Created by Russell Yeo on 13/05/2023.
//

import Foundation

public struct Product: Identifiable, Hashable {
    public let id: Int
    public let title: String
    public let description: String
    public let price: Decimal
    public let discountPercentage: Decimal
    public let rating: Decimal
    public let stock: UInt
    public let brand: String
    public let category: String
    public let thumbnail: ImageSource
    public let images: Array<ImageSource>
    
    public init(
        id: Int,
        title: String,
        description: String,
        price: Decimal,
        discountPercentage: Decimal,
        rating: Decimal,
        stock: UInt,
        brand: String,
        category: String,
        thumbnail: ImageSource,
        images: Array<ImageSource>
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.price = price
        self.discountPercentage = discountPercentage
        self.rating = rating
        self.stock = stock
        self.brand = brand
        self.category = category
        self.thumbnail = thumbnail
        self.images = images
    }
}
