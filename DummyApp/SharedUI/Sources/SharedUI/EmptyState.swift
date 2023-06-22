//
//  EmptyState.swift
//  SharedUI
//
//  Created by Russell Yeo on 14/05/2023.
//

import SwiftUI

public struct EmptyStateView: View {
    public let model: EmptyStateViewModel
    
    public init(model: EmptyStateViewModel) {
        self.model = model
    }
    
    public var body: some View {
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

public struct EmptyStateViewModel {
    public let icon: String
    public let title: String
    public let subtitle: String
    
    public init(icon: String, title: String, subtitle: String) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
    }
}

public extension EmptyStateViewModel {
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
