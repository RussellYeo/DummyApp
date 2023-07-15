import Foundation
import SharedModels

public struct CartItem: Equatable {
    public var product: Product
    public var quantity: UInt
    
    public init(product: Product, quantity: UInt) {
        self.product = product
        self.quantity = quantity
    }
}

extension CartItem: Identifiable {
    public var id: Int {
        return product.id
    }
}
