import Combine
import Dependencies
import SharedModels
import SharedModelsMocks

extension DependencyValues {
    public var cartClient: CartClient {
        get { self[CartClient.self] }
        set { self[CartClient.self] = newValue }
    }
}

extension CartClient: TestDependencyKey {
    public static var previewValue: Self {
        let items: [CartItem] = [
            CartItem(product: .iPhoneX, quantity: 2),
            CartItem(product: .samsungUniverse, quantity: 1)
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
    
    public static var noop: Self {
        let cartPublisher = Just(Cart(items: [], totalPrice: 0, totalProducts: 0, totalQuantity: 0))
            .setFailureType(to: Never.self)
            .eraseToAnyPublisher()
        return Self(
            cartPublisher: cartPublisher,
            addToCart: { (_) in },
            getQuantity: { (_) in nil },
            updateQuantity: { (_,_) in true }
        )
    }
}
