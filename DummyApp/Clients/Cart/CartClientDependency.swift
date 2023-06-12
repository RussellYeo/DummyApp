//
//  CartClientDependency.swift
//  DummyApp
//
//  Created by Russell Yeo on 12/06/2023.
//

import Dependencies

private enum CartClientKey: DependencyKey {
    static let liveValue = CartClient.live
    static let previewValue = CartClient.preview
}

extension DependencyValues {
    var cartClient: CartClient {
        get { self[CartClientKey.self] }
        set { self[CartClientKey.self] = newValue }
    }
}
