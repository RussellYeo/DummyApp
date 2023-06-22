import Dependencies
import DummyAPI
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        withDependencies {
            $0.cartClient = .previewValue
            $0.productsClient = .previewValue
            $0.numberFormatter = .USD
        } operation: {
            ContentView()
        }
    }
}
