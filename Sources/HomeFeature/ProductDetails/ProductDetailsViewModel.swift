import CartPersistence
import Dependencies
import Foundation
import SharedModels

final class ProductDetailsViewModel: ObservableObject {
    
    @Dependency(\.cartClient) var cartClient: CartClient
    
    private let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var navigationTitle: String {
        product.title
    }
    
    var images: [ImageSource] {
        product.images
    }
    
    var productDescription: String {
        product.description
    }
    
    func didTapAddToCart() {
        cartClient.addToCart(product)
    }
}
