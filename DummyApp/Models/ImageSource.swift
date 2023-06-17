//
//  ImageSource.swift
//  DummyApp
//
//  Created by Russell Yeo on 17/06/2023.
//

import Foundation

enum ImageSource: Hashable {
    case url(URL)
    case preview(ImageResource)
}
