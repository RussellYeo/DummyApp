//
//  DummyApp.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import SwiftUI

@main
struct DummyApp: App {
    private let productsProvider = ProductsProviderImpl()
    
    var body: some Scene {
        WindowGroup {
            ContentView(productsProvider: productsProvider)
        }
    }
}
