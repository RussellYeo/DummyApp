import DummyAPI
import SharedModels
import SwiftUI

public struct ProductImage: View {
    public let imageSource: ImageSource
    
    public init(imageSource: ImageSource) {
        self.imageSource = imageSource
    }
    
    public var body: some View {
        switch imageSource {
        case .preview(let resource):
            Image(resource)
                .resizable()
                .scaledToFill()
        case .url(let url):
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        ProgressView()
                        Color.gray.opacity(0.5)
                    }
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    Color.gray.opacity(0.5)
                @unknown default:
                    Color.gray.opacity(0.5)
                }
            }
        }
    }
}

#if DEBUG
import SharedModelsPreview

struct ProductImage_Previews: PreviewProvider {
    static var previews: some View {
        ProductImage(imageSource: .preview(.preview1))
    }
}
#endif
