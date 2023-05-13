//
//  ProductsProvider.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import Combine

/// A provider that provides access to products
protocol ProductsProvider {
    /// Retrieve a paginated list of products
    func getProducts() -> AnyPublisher<ProductsPage, Error>
}

final class ProductsProviderImpl: ProductsProvider {
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient = HTTPClientImpl()) {
        self.httpClient = httpClient
    }
    
    func getProducts() -> AnyPublisher<ProductsPage, Error> {
        let resource = HTTPResource(path: "products")
        return httpClient.fetch(resource: resource)
    }
}
