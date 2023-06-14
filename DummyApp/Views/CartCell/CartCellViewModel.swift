//
//  CartCellViewModel.swift
//  DummyApp
//
//  Created by Russell Yeo on 15/06/2023.
//

import SwiftUI

final class CartCellViewModel: ObservableObject {
    @Binding var product: Product
    @Binding var quantity: UInt
    
    init(product: Binding<Product>, quantity: Binding<UInt>) {
        _product = product
        _quantity = quantity
    }
}
