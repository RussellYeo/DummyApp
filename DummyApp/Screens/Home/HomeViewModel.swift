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
    
    private let productsProvider = ProductsProviderImpl()
    private var subscriptions = Set<AnyCancellable>()
    
    func fetchFirstPage() {
        guard products.count == 0 else { return }
        fetchNextPage()
    }
    
    func fetchNextPage() {
        productsProvider.getProducts(skip: products.count)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { page in
                    self.products += page.products.map(\.model)
                }
            )
            .store(in: &subscriptions)
    }
    
    func onAppearProduct(product: Product) {
        let currentIndex = products.firstIndex(where: { $0.id == product.id })
        let indexShouldFetchNextPage = products.count - 4
        
        if currentIndex == indexShouldFetchNextPage {
            fetchNextPage()
        }
    }
}
