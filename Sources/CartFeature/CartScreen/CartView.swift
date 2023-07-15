import Dependencies
import SharedUI
import SwiftUI

public struct CartView: View {
    @StateObject var viewModel: CartViewModel
    
    public init(viewModel: CartViewModel = .init()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
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

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: withDependencies {
            $0.cartClient = .preview
        } operation: {
            CartViewModel()
        })
    }
}
