import Dependencies
import DummyAPI
import SharedUI
import SwiftUI

public struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = .init()
    
    public init() {}
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private enum Constants {
        static let padding: CGFloat = 16
        static let spacing: CGFloat = 16
        static let columns: CGFloat = 2
        
        static var totalSpacing: CGFloat {
            return (padding * columns) + (spacing * (columns - 1))
        }
        
        static func cellWidth(in screenWidth: CGFloat) -> CGFloat {
            return (screenWidth - Constants.totalSpacing) / Constants.columns
        }
    }
    
    public var body: some View {
        NavigationView {
            if viewModel.error != nil {
                VStack {
                    Spacer()
                    EmptyStateView(model: .internetNotAvailable)
                    Spacer()
                }
            } else {
                GeometryReader { geometry in
                    ScrollView {
                        let cellWidth = Constants.cellWidth(in: geometry.size.width)
                        
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(viewModel.products) { product in
                                NavigationLink(
                                    destination: ProductDetailsView(product: product)
                                ) {
                                    ProductCell(product: product)
                                        .frame(width: cellWidth, height: cellWidth)
                                        .cornerRadius(10)
                                        .clipped()
                                        .onAppear {
                                            viewModel.onAppearProduct(product: product)
                                        }
                                }
                            }
                        }
                        .padding(16)
                    }
                }
                .onAppear {
                    viewModel.fetchFirstPage()
                }
                .navigationTitle("Products")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        withDependencies {
            $0.productsClient = .previewValue
        } operation: {
            HomeView()
        }
    }
}
