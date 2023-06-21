//
//  ProductsPage.swift
//  DummyAPI
//
//  Created by Russell Yeo on 21/06/2023.
//

import Foundation

/// A page of products returned from the server
public struct ProductsPage {
    /// The retrieved products
    public let products: Array<Product>
    /// The total number of results
    public let total: Int
    /// The number of results that were skipped
    public let skip: Int
    /// The page size
    public let limit: Int
    
    public init(
        products: Array<Product>,
        total: Int,
        skip: Int,
        limit: Int
    ) {
        self.products = products
        self.total = total
        self.skip = skip
        self.limit = limit
    }
}
