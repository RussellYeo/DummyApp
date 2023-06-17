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
        ProductImage(imageSource: product.thumbnail)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: .iPhone9)
            .frame(width: 50, height: 50)
    }
}

