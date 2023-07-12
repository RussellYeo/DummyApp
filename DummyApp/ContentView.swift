import CartFeature
import Dependencies
import HomeFeature
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
