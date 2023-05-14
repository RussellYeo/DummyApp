//
//  CartView.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var model: CartViewModel = .init()
    
    var body: some View {
        NavigationView {
            if model.cart.products.isEmpty {
                VStack {
                    Spacer()
                    EmptyStateView(model: .emptyCart)
                    Spacer()
                }
            } else {
                ScrollView {
                    List {
                        ForEach(Array(model.cart.products.keys)) { product in
                            ProductCell(product: product)
                                .frame(height: 80)
                        }
                        Text("Total Price: \(model.formattedPrice())")
                        Text("Total Quantity: \(model.cart.totalQuantity)")
                        Text("Total Products: \(model.cart.totalProducts)")
                    }
                    .padding(16)
                }
            }
        }
        .navigationTitle("Cart")
    }
}
