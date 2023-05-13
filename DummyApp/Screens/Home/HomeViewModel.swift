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
    private var totalShown: Int = 0
    
    func fetchProducts() {
        productsProvider.getProducts()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Error: \(error)")
                        break
                    }
                },
                receiveValue: { page in
                    self.products += page.products.map(\.model)
                    self.totalShown += page.total
                }
            )
            .store(in: &subscriptions)
    }
}
