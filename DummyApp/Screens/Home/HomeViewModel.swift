//
//  HomeViewModel.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import Combine
import Dependencies
import DummyAPI
import Foundation

final class HomeViewModel: ObservableObject {
    @Dependency(\.productsClient) var productsClient
    
    @Published var products: [Product] = []
    @Published var error: Error?
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchFirstPage() {
        guard products.count == 0 else { return }
        fetchNextPage()
    }
    
    func fetchNextPage() {
        productsClient
            .getProducts(products.count, 30)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] page in
                    self?.products += page.products
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
