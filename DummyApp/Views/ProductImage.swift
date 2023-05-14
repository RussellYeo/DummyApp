//
//  ProductImage.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import SwiftUI

struct ProductImage: View {
    let url: URL
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ZStack {
                    ProgressView()
                    Color.gray.opacity(0.5)
                }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                Color.gray.opacity(0.5)
            @unknown default:
                Color.gray.opacity(0.5)
            }
        }
    }
}
