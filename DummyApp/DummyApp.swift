//
//  DummyApp.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import SwiftUI

@main
struct DummyApp: App {
    private let cartProvider = CartProviderImpl()
    private let productsProvider = ProductsProviderImpl()
    
    var body: some Scene {
        WindowGroup {
            ContentView(
                cartProvider: cartProvider,
                productsProvider: productsProvider
            )
        }
    }
}
