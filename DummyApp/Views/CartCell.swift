//
//  CartCell.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import SwiftUI

struct CartCell: View {
    @Binding var cartProduct: CartProduct
    
    var body: some View {
        HStack {
            ProductImage(url: cartProduct.product.thumbnail)
                .frame(width: 50, height: 50)
                .clipped()
                .cornerRadius(6)
            
            VStack(alignment: .leading) {
                Text(cartProduct.product.title)
                Text("Quantity: \(cartProduct.quantity)")
            }
            
            Spacer()
            
            Stepper(
                onIncrement: {
                    cartProduct.quantity += 1
                },
                onDecrement: {
                    if cartProduct.quantity > 1 {
                        cartProduct.quantity -= 1
                    }
                },
                label: {}
            )
        }
    }
}

struct CartCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CartCell(cartProduct: .constant(.init(product: ProductDTO.iPhoneX.model, quantity: 2)))
            CartCell(cartProduct: .constant(.init(product: ProductDTO.samsungUniverse.model, quantity: 1)))
            CartCell(cartProduct: .constant(.init(product: ProductDTO.iPhone9.model, quantity: 1)))
        }
    }
}
