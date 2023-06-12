//
//  ContentView.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

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
    private static var storage: CartStorage = .init()
    
    static var previews: some View {
        ContentView()
            .environmentObject(storage)
    }
}
