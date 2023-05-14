//
//  ProductsProviderPreviewSupport.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import Combine
import Foundation

final class ProductsProviderPreviewSupport: ProductsProvider {
    func getProducts(skip: Int?, limit: Int?) -> AnyPublisher<ProductsPage, Error> {
        let page = ProductsPage(
            products: [],
            total: 10,
            skip: 0,
            limit: 3
        )
        return Just(page)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
