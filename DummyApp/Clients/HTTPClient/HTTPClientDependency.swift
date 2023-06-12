//
//  HTTPClientDependency.swift
//  DummyApp
//
//  Created by Russell Yeo on 12/06/2023.
//

import Dependencies

private enum HTTPClientKey: DependencyKey {
    static let liveValue = HTTPClientLive()
}

extension DependencyValues {
    var httpClient: HTTPClientLive {
        get { self[HTTPClientKey.self] }
        set { self[HTTPClientKey.self] = newValue }
    }
}
