//
//  CartViewModel.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import Combine
import Dependencies
import DummyAPI
import Foundation

final class CartViewModel: ObservableObject {
    @Dependency(\.cartClient) var cartClient
    @Dependency(\.numberFormatter) var numberFormatter
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var items: [CartItem] = []
    @Published var isEmptyState: Bool = true
    @Published var totalPrice: String?
    @Published var totalQuantity: UInt?
    @Published var totalProducts: UInt?
    
    init() {
        self.numberFormatter.setNumberStyle(.currency)
        self.updateStorage()
        self.updateUI()
    }
    
    func updateStorage() {
        $items
            .sink(receiveValue: { [weak self] items in
                guard let self else { return }
                for item in items {
                    guard item.quantity != self.cartClient.getQuantity(item.product) else {
                        return
                    }
                    _ = self.cartClient.updateQuantity(item.product, item.quantity)
                }
            })
            .store(in: &cancellables)
    }
    
    func updateUI() {
        cartClient
            .cartPublisher
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self else { return }
                    switch value {
                    case .failure:
                        self.items = []
                    case .finished:
                        break
                    }
                  },
                receiveValue: { [weak self] cart in
                    guard let self else { return }
                    self.isEmptyState = cart.items.isEmpty
                    self.items = cart.items
                    
                    let totalPriceNumber = NSDecimalNumber(decimal: cart.totalPrice)
                    self.totalPrice = self.numberFormatter.string(totalPriceNumber)
                    self.totalQuantity = cart.totalQuantity
                    self.totalProducts = cart.totalProducts
                }
            )
            .store(in: &cancellables)
    }
    
}
