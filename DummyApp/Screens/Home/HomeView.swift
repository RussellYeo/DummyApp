//
//  HomeView.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var model: HomeViewModel = .init()
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private enum Constants {
        static let padding: CGFloat = 16
        static let spacing: CGFloat = 16
        static let columns: CGFloat = 2
        
        static var totalSpacing: CGFloat {
            return (padding * columns) + (spacing * (columns - 1))
        }
        
        static func imageWidth(for screenWidth: CGFloat) -> CGFloat {
            return (screenWidth - Constants.totalSpacing) / Constants.columns
        }
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    let imageWidth = Constants.imageWidth(for: geometry.size.width)
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(model.products) { product in
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
                            .frame(width: imageWidth, height: imageWidth)
                            .cornerRadius(10)
                            .clipped()
                        }
                    }
                    .padding(16)
                }
            }
            .onAppear {
                model.fetchProducts()
            }
            .navigationTitle("Products")
        }
    }
}

