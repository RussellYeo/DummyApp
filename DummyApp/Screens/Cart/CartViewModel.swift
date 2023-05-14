//
//  CartViewModel.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import Combine
import Foundation

final class CartViewModel: ObservableObject {
    @Published var cart = Cart()
    private lazy var currencyFormatter = createCurrencyFormatter()
    
    func addToCart(product: Product) {
        cart.add(product: product)
    }
    
    func formattedPrice() -> String {
        currencyFormatter.string(from: NSNumber(nonretainedObject: cart.totalPrice)) ?? "unknown"
    }
    
    private func createCurrencyFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
        
}
