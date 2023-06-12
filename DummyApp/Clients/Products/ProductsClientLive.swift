//
//  ProductsClientLive.swift
//  DummyApp
//
//  Created by Russell Yeo on 12/06/2023.
//

import Dependencies

extension ProductsClient {
    static var live: Self {
        @Dependency(\.httpClient) var httpClient
        
        return Self(
            getProducts: { (skip, limit) in
                httpClient.fetch(
                    resource: .init(
                        path: "products",
                        queryItems: [
                            skip.map { .init(name: "skip", value: "\($0)") },
                            limit.map { .init(name: "limit", value: "\($0)") }
                        ]
                        .compactMap { $0 }
                    )
                )
            }
        )
    }
}

