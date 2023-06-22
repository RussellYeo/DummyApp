//
//  ProductsClientInterface.swift
//  DummyAPI
//
//  Created by Russell Yeo on 13/05/2023.
//

import Combine
import Dependencies
import Foundation

/// Provides access to products
public struct ProductsClient {
    /// Fetches a list of products with optional pagination parameters.
    /// - Parameters:
    ///   - skip: The number of products to skip. Default value is 0.
    ///   - limit: The maximum number of products to return. Default value is 30.
    /// - Returns: A publisher that emits a `ProductsPage` object or an error.
    public var getProducts: (_ skip: Int?, _ limit: Int?) -> AnyPublisher<ProductsPage, Error>
    
    /// Initialise a ProductsClient
    public init(getProducts: @escaping (_: Int?, _: Int?) -> AnyPublisher<ProductsPage, Error>) {
        self.getProducts = getProducts
    }
}
