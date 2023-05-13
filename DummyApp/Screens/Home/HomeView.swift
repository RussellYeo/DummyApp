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
        
        static func cellWidth(in screenWidth: CGFloat) -> CGFloat {
            return (screenWidth - Constants.totalSpacing) / Constants.columns
        }
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    let cellWidth = Constants.cellWidth(in: geometry.size.width)
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(model.products) { product in
                            ProductCell(product: product)
                                .frame(width: cellWidth, height: cellWidth)
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
