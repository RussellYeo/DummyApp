import Combine
import Dependencies

extension DependencyValues {
    public var productsClient: ProductsClient {
        get { self[ProductsClient.self] }
        set { self[ProductsClient.self] = newValue }
    }
}

extension ProductsClient: TestDependencyKey {
    public static var previewValue: Self {
        let page = ProductsPage(
            products: [
                .preview_iPhone9,
                .preview_iPhoneX,
                .preview_samsungUniverse
            ],
            total: 10,
            skip: 0,
            limit: 3
        )
        return Self(
            getProducts: { (_, _) in
                Just(page)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            }
        )
    }
    
    public static let testValue = Self(
        getProducts: unimplemented("\(Self.self).getProducts")
    )
}
