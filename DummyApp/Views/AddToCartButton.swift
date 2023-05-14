//
//  AddToCartButton.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import SwiftUI

struct AddToCartButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "cart.badge.plus")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("Add to Cart")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
        }
    }
}

struct AddToCartButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButton {
            //
        }
    }
}
