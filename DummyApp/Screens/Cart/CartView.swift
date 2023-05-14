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
                    List(viewModel.products, id: \.id) { cartProduct in
                        CartCell(cartProduct: cartProduct)
                    }
                    .listStyle(.plain)
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
