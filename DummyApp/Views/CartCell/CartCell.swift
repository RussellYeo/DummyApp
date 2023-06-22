import DummyAPI
import SharedUI
import SharedModels
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
            CartCell(viewModel: .init(product: .constant(.preview_iPhoneX), quantity: .constant(2)))
            CartCell(viewModel: .init(product: .constant(.preview_samsungUniverse), quantity: .constant(1)))
            CartCell(viewModel: .init(product: .constant(.preview_iPhone9), quantity: .constant(1)))
        }
    }
}
