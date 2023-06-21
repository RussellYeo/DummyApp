//
//  ImageCarousel.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import DummyAPI
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
                .preview(._1),
                .preview(._2),
                .preview(._3),
                .preview(._4)
            ]
        )
        .frame(width: 300, height: 300)
    }
}
