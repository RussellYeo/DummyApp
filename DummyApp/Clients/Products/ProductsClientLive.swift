//
//  ProductsClientLive.swift
//  DummyApp
//
//  Created by Russell Yeo on 12/06/2023.
//

import Combine
import Dependencies

extension ProductsClient {
    static var live: Self {
        @Dependency(\.httpClient) var httpClient
        
        return Self(
            getProducts: { (skip, limit) in
                let dtoPublisher: AnyPublisher<ProductsPageDTO, Error> = httpClient.fetch(
                    resource: .init(
                        path: "products",
                        queryItems: [
                            skip.map { .init(name: "skip", value: "\($0)") },
                            limit.map { .init(name: "limit", value: "\($0)") }
                        ]
                        .compactMap { $0 }
                    )
                )
                return dtoPublisher.map { dto in
                    return dto.model
                }
                .eraseToAnyPublisher()
            }
        )
    }
}

