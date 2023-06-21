//
//  Dependencies.swift
//  DummyApp
//
//  Created by Russell Yeo on 21/06/2023.
//
//  Load dependencies into the dependency manager

import Dependencies
import DummyAPI
import DummyAPILive

// MARK: - ProductsClient

private enum ProductsClientKey: DependencyKey {
    public static let liveValue = ProductsClient.live
    public static let previewValue = ProductsClient.preview
}

extension DependencyValues {
    var productsClient: ProductsClient {
        get { self[ProductsClientKey.self] }
        set { self[ProductsClientKey.self] = newValue }
    }
}

// MARK: - CartClient

private enum CartClientKey: DependencyKey {
    static let liveValue = CartClient.live
    static let previewValue = CartClient.preview
}

extension DependencyValues {
    var cartClient: CartClient {
        get { self[CartClientKey.self] }
        set { self[CartClientKey.self] = newValue }
    }
}
