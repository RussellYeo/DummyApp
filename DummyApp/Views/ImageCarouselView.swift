//
//  ImageCarouselView.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import SwiftUI

struct ImageCarouselView: View {
    let imageURLs: [URL]
    
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<imageURLs.count) { index in
                    ProductImage(url: imageURLs[index])
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
            imageURLs: [
                URL(string: "https://i.dummyjson.com/data/products/2/1.jpg")!,
                URL(string: "https://i.dummyjson.com/data/products/2/2.jpg")!,
                URL(string: "https://i.dummyjson.com/data/products/2/3.jpg")!
            ]
        )
        .frame(width: 300, height: 300)
    }
}
