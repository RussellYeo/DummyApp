//
//  EmptyState.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import SwiftUI

struct EmptyStateView: View {
    let model: EmptyStateViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: model.icon)
                .resizable()
                .frame(width: 40, height: 40)
                .aspectRatio(contentMode: .fit)
            
            Spacer()
                .frame(height: 4)
            
            Text(model.title)
                .font(.system(size: 24, weight: .bold))

            Text(model.subtitle)
                .font(.system(size: 16, weight: .regular))
                .multilineTextAlignment(.center)
        }
        .padding(50)
    }
}

struct EmptyStateViewModel {
    let icon: String
    let title: String
    let subtitle: String
}

extension EmptyStateViewModel {
    static var emptyCart: EmptyStateViewModel {
        EmptyStateViewModel(
            icon: "bag.fill",
            title: "Empty cart",
            subtitle: "Add some products to your cart and come back!"
        )
    }
    
    static var internetNotAvailable: EmptyStateViewModel {
        EmptyStateViewModel(
            icon: "wifi.slash",
            title: "Nothing to display",
            subtitle: "Please try refreshing the page or contacting support"
        )
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmptyStateView(model: .emptyCart)
                .previewDisplayName("Empty Cart")
            
            EmptyStateView(model: .internetNotAvailable)
                .previewDisplayName("Internet Not Available")
        }
    }
}
