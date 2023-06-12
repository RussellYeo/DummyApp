//
//  DummyApp.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import SwiftUI

@main
struct DummyApp: App {
    let storage: CartStorage = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(storage)
        }
    }
}
