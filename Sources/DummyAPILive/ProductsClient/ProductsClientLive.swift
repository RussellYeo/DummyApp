//
//  ProductsClientLive.swift
//  DummyAPILive
//
//  Created by Russell Yeo on 12/06/2023.
//

import Combine
import Dependencies
import DummyAPI

extension DummyAPIClient {
    public static var live: Self {
        let httpClient = HTTPClient()
        
        return Self(
            getProducts: { (skip, limit) in
                let dtoPublisher: AnyPublisher<ProductsPageDTO, Error> = httpClient.fetch(
                    resource: HTTPResource(
                        path: "products",
                        queryItems: [
                            skip.map { .init(name: "skip", value: "\($0)") },
                            limit.map { .init(name: "limit", value: "\($0)") }
                        ]
                        .compactMap { $0 }
                    )
                )
                return dtoPublisher
                    .map(\.model)
                    .eraseToAnyPublisher()
            }
        )
    }
}

extension DummyAPIClient: DependencyKey {
    public static let liveValue: DummyAPIClient = .live
}
