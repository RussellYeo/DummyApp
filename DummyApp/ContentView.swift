//
//  ContentView.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import SwiftUI

struct ContentView: View {
    let productsProvider: ProductsProvider
    
    var body: some View {
        TabView {
            HomeView(productsProvider: productsProvider)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            CartView()
                .tabItem {
                    Image(systemName: "bag.fill")
                    Text("Cart")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(productsProvider: ProductsProviderPreviewSupport())
    }
}
