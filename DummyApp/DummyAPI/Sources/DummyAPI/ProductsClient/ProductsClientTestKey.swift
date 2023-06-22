import Combine
import Dependencies

extension DependencyValues {
    public var cartClient: CartClient {
        get { self[CartClient.self] }
        set { self[CartClient.self] = newValue }
    }
}

extension CartClient: TestDependencyKey {
    public static var previewValue: Self {
        let items: [CartItem] = [
            CartItem(product: .preview_iPhoneX, quantity: 2),
            CartItem(product: .preview_samsungUniverse, quantity: 1)
        ]
        let cart = Cart(
            items: items,
            totalPrice: items.map(\.product).map(\.price).reduce(0, +),
            totalProducts: UInt(items.count),
            totalQuantity: items.map(\.quantity).reduce(0, +)
        )
        let cartPublisher = Just(cart)
            .setFailureType(to: Never.self)
            .eraseToAnyPublisher()
        return Self(
            cartPublisher: cartPublisher,
            addToCart: { (_) in },
            getQuantity: { (_) in nil },
            updateQuantity: { (_,_) in true }
        )
    }
    
    public static let testValue = Self(
        cartPublisher: unimplemented("\(Self.self).cartPublisher"),
        addToCart: unimplemented("\(Self.self).addToCart"),
        getQuantity: unimplemented("\(Self.self).getQuantity"),
        updateQuantity: unimplemented("\(Self.self).updateQuantity")
    )
}
