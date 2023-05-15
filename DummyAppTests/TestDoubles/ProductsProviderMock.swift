//
//  ProductsProviderMock.swift
//  DummyAppTests
//
//  Created by Russell Yeo on 15/05/2023.
//

import Combine
@testable import DummyApp
import Foundation

final class ProductsProviderMock: ProductsProvider {
    
    // MARK: getProducts
    
    var getProductsCallsCount = 0
    var getProductsCalled: Bool {
        return getProductsCallsCount > 0
    }
    var getProductsReturnValue: AnyPublisher<ProductsPage, Error>!
    
    func getProducts(skip: Int?, limit: Int?) -> AnyPublisher<ProductsPage, Error> {
        getProductsCallsCount += 1
        return getProductsReturnValue
    }

}
