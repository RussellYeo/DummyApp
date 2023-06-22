//
//  ImageCarousel.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import DummyAPI
import SharedUI
import SharedModels
import SwiftUI

struct ImageCarousel: View {
    let images: [ImageSource]
    @State private var currentPage: Int = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<images.count, id: \.self) { index in
                    ProductImage(imageSource: images[index])
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct ImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarousel(
            images: [
                .preview(.preview1),
                .preview(.preview2),
                .preview(.preview3),
                .preview(.preview4)
            ]
        )
        .frame(width: 300, height: 300)
    }
}
