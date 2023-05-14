//
//  ProductDetailsViewModel.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import Foundation

final class ProductDetailsViewModel: ObservableObject {
    private let product: Product
    private let cartProvider: CartProvider
    
    init(product: Product, cartProvider: CartProvider) {
        self.product = product
        self.cartProvider = cartProvider
    }
    
    var navigationTitle: String {
        product.title
    }
    
    var imageURLs: [URL] {
        product.images
    }
    
    var productDescription: String {
        product.description
    }
    
    func didTapAddToCart() {
        cartProvider.addToCart(product)
    }
}
