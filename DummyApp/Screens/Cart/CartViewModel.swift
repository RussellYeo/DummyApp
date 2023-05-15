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
    
    private var productsSubject = CurrentValueSubject<[CartProduct], Never>([])
    var products: [CartProduct] {
        get { productsSubject.value }
        set { productsSubject.send(newValue) }
    }
     
    @Published var isEmptyState: Bool = true
    @Published var totalPrice: String?
    @Published var totalQuantity: UInt?
    @Published var totalProducts: UInt?
    
    init(cartProvider: CartProvider) {
        self.cartProvider = cartProvider
        self.currencyFormatter = currencyFormatter
        self.subscribeToProductsUpdates()
    }
    
    func reload() {
        cartProvider
            .cartPublisher
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
                receiveValue: { [weak self] cart in
                    guard let self else { return }
                    self.isEmptyState = cart.products.isEmpty
                    self.products = cart.products
                    
                    let totalPriceNumber = NSDecimalNumber(decimal: cart.totalPrice)
                    self.totalPrice = self.currencyFormatter.string(from: totalPriceNumber)                    
                    
                    self.totalQuantity = cart.totalQuantity
                }
            )
            .store(in: &cancellables)
    }
    
    private func subscribeToProductsUpdates() {
        productsSubject
            .sink { [weak self] products in
                guard let self else { return }
                products.forEach { cartProduct in
                    self.cartProvider.updateQuantity(
                        product: cartProduct.product,
                        quantity: cartProduct.quantity
                    )
                }
            }
            .store(in: &cancellables)
    }
        
    private func createCurrencyFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
