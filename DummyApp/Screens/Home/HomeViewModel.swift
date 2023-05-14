//
//  HomeViewModel.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var error: Error?
    
    private let productsProvider: ProductsProvider
    private var cancellables = Set<AnyCancellable>()
    
    init(productsProvider: ProductsProvider) {
        self.productsProvider = productsProvider
    }
    
    func fetchFirstPage() {
        guard products.count == 0 else { return }
        fetchNextPage()
    }
    
    func fetchNextPage() {
        productsProvider.getProducts(skip: products.count)
            .receive(on: DispatchQueue.main)
            .map { page in page.products.map(\.model) }
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { products in
                    self.products += products
                }
            )
            .store(in: &cancellables)
    }
    
    func onAppearProduct(product: Product) {
        let currentIndex = products.firstIndex(where: { $0.id == product.id })
        let indexShouldFetchNextPage = products.count - 4
        
        if currentIndex == indexShouldFetchNextPage {
            fetchNextPage()
        }
    }
}
