import Foundation
import SharedModels

public extension Product {
    static var iPhone9: Product {
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
            thumbnail: .url(URL(string: "https://i.dummyjson.com/data/products/1/thumbnail.jpg")!),
            images: [
                .url(URL(string: "https://i.dummyjson.com/data/products/1/1.jpg")!),
                .url(URL(string: "https://i.dummyjson.com/data/products/1/2.jpg")!),
                .url(URL(string: "https://i.dummyjson.com/data/products/1/3.jpg")!),
                .url(URL(string: "https://i.dummyjson.com/data/products/1/4.jpg")!)
            ]
        )
    }
    
    static var iPhoneX: Product {
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
            thumbnail: .url(URL(string: "https://i.dummyjson.com/data/products/2/thumbnail.jpg")!),
            images: [
                .url(URL(string: "https://i.dummyjson.com/data/products/2/1.jpg")!),
                .url(URL(string: "https://i.dummyjson.com/data/products/2/2.jpg")!)
            ]
        )
    }
    
    static var samsungUniverse: Product {
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
            thumbnail: .url(URL(string: "https://i.dummyjson.com/data/products/3/thumbnail.jpg")!),
            images: [
                .url(URL(string: "https://i.dummyjson.com/data/products/3/1.jpg")!),
                .url(URL(string: "https://i.dummyjson.com/data/products/3/2.jpg")!),
                .url(URL(string: "https://i.dummyjson.com/data/products/3/3.jpg")!)
            ]
        )
    }
}
