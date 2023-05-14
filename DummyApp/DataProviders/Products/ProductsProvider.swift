//
//  ProductsProvider.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import Foundation
import Combine

/// Provides access to products
protocol ProductsProvider {
    /// Fetches a list of products with optional pagination parameters.
    /// - Parameters:
    ///   - skip: The number of products to skip. Default value is 0.
    ///   - limit: The maximum number of products to return. Default value is 30.
    /// - Returns: A publisher that emits a `ProductsPage` object or an error.
    func getProducts(skip: Int?, limit: Int?) -> AnyPublisher<ProductsPage, Error>
}

extension ProductsProvider {
    // Default values
    func getProducts(skip: Int? = 0, limit: Int? = 30) -> AnyPublisher<ProductsPage, Error> {
        self.getProducts(skip: skip, limit: limit)
    }
}

final class ProductsProviderImpl: ProductsProvider {
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient = HTTPClientImpl()) {
        self.httpClient = httpClient
    }
    
    func getProducts(skip: Int?, limit: Int?) -> AnyPublisher<ProductsPage, Error> {
        let queryItems: [URLQueryItem] = [
            skip.map { .init(name: "skip", value: "\($0)") },
            limit.map { .init(name: "limit", value: "\($0)") }
        ]
        .compactMap { $0 }
        
        let resource = HTTPResource(
            path: "products",
            queryItems: queryItems
        )
        return httpClient.fetch(resource: resource)
    }
}
