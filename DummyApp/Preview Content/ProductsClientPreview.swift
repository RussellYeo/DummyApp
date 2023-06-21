//
//  ProductsClientPreview.swift
//  DummyApp
//
//  Created by Russell Yeo on 21/06/2023.
//

import Combine
import DummyAPI

extension ProductsClient {
    static var preview: Self {
        let page = ProductsPage(
            products: [
                .iPhone9,
                .iPhoneX,
                .samsungUniverse
            ],
            total: 10,
            skip: 0,
            limit: 3
        )
        return Self(
            getProducts: { (_, _) in
                Just(page)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            }
        )
    }
}
