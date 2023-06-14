//
//  ProductsClientDependency.swift
//  DummyApp
//
//  Created by Russell Yeo on 12/06/2023.
//

import Dependencies

private enum ProductsClientKey: DependencyKey {
    static let liveValue = ProductsClient.preview
    static let previewValue = ProductsClient.preview
}

extension DependencyValues {
    var productsClient: ProductsClient {
        get { self[ProductsClientKey.self] }
        set { self[ProductsClientKey.self] = newValue }
    }
}
