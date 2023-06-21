//
//  ProductDetailsViewModel.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import Dependencies
import DummyAPI
import Foundation

final class ProductDetailsViewModel: ObservableObject {
    @Dependency(\.cartClient) var cartClient
    
    private let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var navigationTitle: String {
        product.title
    }
    
    var images: [ImageSource] {
        product.images
    }
    
    var productDescription: String {
        product.description
    }
    
    func didTapAddToCart() {
        cartClient.addToCart(product)
    }
}
