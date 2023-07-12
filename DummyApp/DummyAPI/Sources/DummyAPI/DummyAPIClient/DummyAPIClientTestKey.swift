import Combine
import Dependencies

extension DependencyValues {
    public var dummyAPIClient: DummyAPIClient {
        get { self[DummyAPIClient.self] }
        set { self[DummyAPIClient.self] = newValue }
    }
}

extension DummyAPIClient: TestDependencyKey {
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
