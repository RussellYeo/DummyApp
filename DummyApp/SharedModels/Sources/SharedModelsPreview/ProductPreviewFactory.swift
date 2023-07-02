import DeveloperToolsSupport
import SharedModels

public extension Product {
    static var preview_iPhone9: Product {
        Product(
            id: 1,
            title: "iPhone 9",
            description: "An apple mobile which is nothing like apple",
            price: 549,
            discountPercentage: 12.96,
            rating: 4.69,
            stock: 94,
            brand: "Apple",
            category: "smartphones",
            thumbnail: .preview(.preview1),
            images: [
                .preview(.preview1),
                .preview(.preview2),
                .preview(.preview3),
                .preview(.preview4)
            ]
        )
    }
    
    static var preview_iPhoneX: Product {
        Product(
            id: 2,
            title: "iPhone X",
            description: "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
            price: 899,
            discountPercentage: 17.94,
            rating: 4.44,
            stock: 34,
            brand: "Apple",
            category: "smartphones",
            thumbnail: .preview(.preview2),
            images: [
                .preview(.preview2),
                .preview(.preview3),
                .preview(.preview4),
                .preview(.preview1)
            ]
        )
    }
    
    static var preview_samsungUniverse: Product {
        Product(
            id: 3,
            title: "Samsung Universe 9",
            description: "Samsung's new variant which goes beyond Galaxy to the Universe",
            price: 1249,
            discountPercentage: 15.46,
            rating: 4.09,
            stock: 36,
            brand: "Samsung",
            category: "smartphones",
            thumbnail: .preview(.preview3),
            images: [
                .preview(.preview3),
                .preview(.preview4),
                .preview(.preview1),
                .preview(.preview2),
            ]
        )
    }
}
