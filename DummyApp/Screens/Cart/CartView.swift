//
//  CartView.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import Combine
import SwiftUI

struct CartView: View {
    @StateObject var viewModel: CartViewModel
    
    init(cartProvider: CartProvider) {
        let viewModel = CartViewModel(cartProvider: cartProvider)
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isEmptyState {
                    VStack {
                        Spacer()
                        EmptyStateView(model: .emptyCart)
                        Spacer()
                    }
                } else {
                    List {
                        Section {
                            ForEach(viewModel.products.indices, id: \.self) { index in
                                CartCell(cartProduct: self.$viewModel.products[index])
                            }
                        }
                        Section {
                            if let totalPrice = viewModel.totalPrice {
                                Text("Total: \(totalPrice)")
                            }
                            if let totalQuantity = viewModel.totalQuantity {
                                Text("\(totalQuantity) items")
                            }
                            if let totalProducts = viewModel.totalProducts {
                                Text("\(totalProducts) products")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Cart")
            .onAppear(perform: viewModel.reload)
        }
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cartProvider: CartProviderPreviewSupport())
    }
}
