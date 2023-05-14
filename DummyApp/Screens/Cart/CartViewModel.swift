//
//  CartViewModel.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import Combine
import Foundation

final class CartViewModel: ObservableObject {
    private let cartProvider: CartProvider
    private lazy var currencyFormatter = createCurrencyFormatter()
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var isEmptyState: Bool = true
    @Published var products: [CartProduct] = []
    @Published var totalPrice: String?
    @Published var totalQuantity: String?
    
    init(cartProvider: CartProvider) {
        self.cartProvider = cartProvider
        self.currencyFormatter = currencyFormatter
    }
    
    var productsPublisher: AnyPublisher<[CartProduct], Never> {
        cartProvider
            .productsPublisher
            .eraseToAnyPublisher()
    }
    
    var totalPricePublisher: AnyPublisher<String?, Never> {
        cartProvider
            .totalPricePublisher
            .map { [weak self] totalPrice in
                let number = NSNumber(nonretainedObject: totalPrice)
                return self?.currencyFormatter.string(from: number)
            }
            .eraseToAnyPublisher()
    }
    
    var totalQuantityPublisher: AnyPublisher<String?, Never> {
        cartProvider
            .totalQuantityPublisher
            .map { totalQuantity in
                guard totalQuantity > 0 else { return nil }
                return "\(totalQuantity) items"
            }
            .eraseToAnyPublisher()
    }
    
    func reload() {
        products = []
        cartProvider
            .productsPublisher
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self else { return }
                    switch value {
                    case .failure:
                        self.products = []
                    case .finished:
                        break
                    }
                  },
                receiveValue: { [weak self] products in
                    guard let self else { return }
                    if !products.isEmpty {
                        self.isEmptyState = false
                    }
                    self.products = products
                }
            )
            .store(in: &cancellables)
    }
    
    private func createCurrencyFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
