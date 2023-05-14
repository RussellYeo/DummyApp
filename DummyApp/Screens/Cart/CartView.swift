//
//  CartView.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import SwiftUI

struct CartView: View {
    @StateObject var viewModel: CartViewModel = .init()
    
    var body: some View {
        NavigationView {
            if viewModel.cart.products.isEmpty {
                VStack {
                    Spacer()
                    EmptyStateView(model: .emptyCart)
                    Spacer()
                }
            } else {
                ScrollView {
                    List {
                        ForEach(Array(viewModel.cart.products.keys)) { product in
                            ProductCell(product: product)
                                .frame(height: 80)
                        }
                        Text("Total Price: \(viewModel.formattedPrice())")
                        Text("Total Quantity: \(viewModel.cart.totalQuantity)")
                        Text("Total Products: \(viewModel.cart.totalProducts)")
                    }
                    .padding(16)
                }
            }
        }
        .navigationTitle("Cart")
    }
}
