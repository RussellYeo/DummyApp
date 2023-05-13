//
//  ProductCell.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import SwiftUI

struct ProductCell: View {
    let product: Product
    
    var body: some View {
        AsyncImage(url: product.thumbnail) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            default:
                Color.gray
                    .opacity(0.5)
            }
        }
    }
}
