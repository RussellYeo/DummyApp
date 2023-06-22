import Combine
import Dependencies
import DummyAPI
import Foundation

extension CartClient {
    public static var live: Self {
        let storage = CartStorage()
        let storageSubject = CurrentValueSubject<CartStorage, Never>(storage)
        let cartPublisher: AnyPublisher<Cart, Never> = storageSubject
            .map { (cart) in
                Cart(
                    items: cart.products.map(CartItem.init),
                    totalPrice: cart.totalPrice,
                    totalProducts: cart.totalProducts,
                    totalQuantity: cart.totalQuantity
                )
            }
            .eraseToAnyPublisher()
        
        return Self(
            cartPublisher: cartPublisher,
            addToCart: { (product) in
                storage.add(product: product)
            },
            getQuantity: { (product) in
                storage.getQuantity(product: product)
            },
            updateQuantity: { (product, quantity) in
                let result = storage.update(product: product, quantity: quantity)
                storageSubject.send(storage)
                return result
            }
        )
    }
}

extension CartClient: DependencyKey {
    public static let liveValue: CartClient = .live
}
