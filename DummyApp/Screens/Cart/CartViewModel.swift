//
//  CartViewModel.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import Combine
import Dependencies
import Foundation

final class CartViewModel: ObservableObject {
    @Dependency(\.cartClient) var cartClient
    @Dependency(\.numberFormatter) var numberFormatter
    
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
    
    init() {
        self.numberFormatter.setNumberStyle(.currency)
        self.subscribeToProductsUpdates()
    }
    
    func reload() {
        cartClient
            .cart()
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
                    self.totalPrice = self.numberFormatter.string(totalPriceNumber)
                    
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
                    _ = self.cartClient.updateQuantity(
                        cartProduct.product,
                        cartProduct.quantity
                    )
                }
            }
            .store(in: &cancellables)
    }

}
