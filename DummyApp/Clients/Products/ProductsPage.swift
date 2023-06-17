//
//  ProductsPage.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import Foundation

/// A page of products returned from the server
struct ProductsPage {
    /// The retrieved products
    let products: Array<Product>
    /// The total number of results
    let total: Int
    /// The number of results that were skipped
    let skip: Int
    /// The page size
    let limit: Int
}

struct ProductsPageDTO: Decodable, Equatable {
    /// The retrieved products
    let products: Array<ProductDTO>
    /// The total number of results
    let total: Int
    /// The number of results that were skipped
    let skip: Int
    /// The page size
    let limit: Int
    
    var model: ProductsPage {
        return .init(
            products: products.map(\.model),
            total: total,
            skip: skip,
            limit: limit
        )
    }
}
