import Combine
import Dependencies
import DummyAPI
import SharedUI
import SwiftUI

struct CartView: View {
    @StateObject var viewModel: CartViewModel = .init()
    
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
                            ForEach($viewModel.items) { item in
                                CartCell(viewModel: .init(product: item.product, quantity: item.quantity))
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
        }
    }
}

#if DEBUG
import DummyAPIPreview

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        withDependencies {
            $0.cartClient = .previewValue
        } operation: {
            CartView()
        }
    }
}
#endif
