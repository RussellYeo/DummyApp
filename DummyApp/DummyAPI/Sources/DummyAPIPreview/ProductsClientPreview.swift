import Combine
import DummyAPI
import SharedModelsPreview

extension ProductsClient {
    public static var preview: Self {
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
}
