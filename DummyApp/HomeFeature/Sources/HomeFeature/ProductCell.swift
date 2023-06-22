import DummyAPI
import SharedUI
import SharedModels
import SwiftUI

struct ProductCell: View {
    let product: Product
    
    var body: some View {
        ProductImage(imageSource: product.thumbnail)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: .preview_iPhone9)
            .frame(width: 50, height: 50)
    }
}

