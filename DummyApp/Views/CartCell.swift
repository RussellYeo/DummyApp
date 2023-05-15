//
//  CartCell.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import SwiftUI

struct CartCell: View {
    let cartProduct: CartProduct
    
    var body: some View {
        HStack {
            ProductImage(url: cartProduct.product.thumbnail)
                .frame(width: 50, height: 50)
                .clipped()
                .cornerRadius(6)
            
            Text(cartProduct.product.title)
        }
    }
}
