import Combine
import Dependencies

extension DependencyValues {
    public var productsClient: ProductsClient {
        get { self[ProductsClient.self] }
        set { self[ProductsClient.self] = newValue }
    }
}

extension ProductsClient: TestDependencyKey {
    public static var previewValue: Self = .noop
    
    public static let testValue = Self(
        getProducts: unimplemented("\(Self.self).getProducts")
    )
    
    public static let noop = Self(
        getProducts: { (_, _) in
            Just(.init(products: [], total: 0, skip: 0, limit: 0))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    )
}
