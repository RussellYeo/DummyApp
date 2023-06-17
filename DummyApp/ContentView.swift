//
//  ContentView.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import Dependencies
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Group {
                HomeView().tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                CartView().tabItem {
                    Image(systemName: "bag.fill")
                    Text("Cart")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        withDependencies {
            $0.cartClient = .preview
            $0.productsClient = .preview
            $0.numberFormatter = .USD
        } operation: {
            ContentView()
        }
    }
}
