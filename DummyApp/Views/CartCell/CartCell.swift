//
//  CartCell.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import DummyAPI
import SwiftUI

struct CartCell: View {
    @ObservedObject var viewModel: CartCellViewModel
    
    var body: some View {
        HStack {
            ProductImage(imageSource: viewModel.product.thumbnail)
                .frame(width: 50, height: 50)
                .clipped()
                .cornerRadius(4)
            
            VStack(alignment: .leading) {
                Text(viewModel.product.title)
            }
            
            Spacer()
            
            Stepper(value: $viewModel.quantity, in: 0...100, step: 1) {
                Spacer()
                Text("Quantity: \(viewModel.quantity)")
                Spacer()
            }
        }
    }
}

struct CartCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CartCell(viewModel: .init(product: .constant(Product.iPhoneX), quantity: .constant(2)))
            CartCell(viewModel: .init(product: .constant(Product.samsungUniverse), quantity: .constant(1)))
            CartCell(viewModel: .init(product: .constant(Product.iPhone9), quantity: .constant(1)))
        }
    }
}
