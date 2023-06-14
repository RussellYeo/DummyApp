//
//  CartCell.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import SwiftUI

struct CartCell: View {
    @ObservedObject var viewModel: CartCellViewModel
    
    var body: some View {
        HStack {
            ProductImage(url: viewModel.product.thumbnail)
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
            CartCell(viewModel: .init(product: .constant(ProductDTO.iPhoneX.model), quantity: .constant(2)))
            CartCell(viewModel: .init(product: .constant(ProductDTO.samsungUniverse.model), quantity: .constant(1)))
            CartCell(viewModel: .init(product: .constant(ProductDTO.iPhone9.model), quantity: .constant(1)))
        }
    }
}
