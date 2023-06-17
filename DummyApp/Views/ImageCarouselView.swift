//
//  ImageCarouselView.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import SwiftUI

struct ImageCarouselView: View {
    let images: [ImageSource]
    @State private var currentPage: Int = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(images, id: \.self) { imageSource in
                    ProductImage(imageSource: imageSource)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct ImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarouselView(
            images: [
                .preview(._1),
                .preview(._2),
                .preview(._3),
                .preview(._4)
            ]
        )
        .frame(width: 300, height: 300)
    }
}
