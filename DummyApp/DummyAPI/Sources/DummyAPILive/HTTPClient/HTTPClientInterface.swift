//
//  HTTPClientInterface.swift
//  DummyAPILive
//
//  Created by Russell Yeo on 12/06/2023.
//

import Combine

/// A  HTTP client to handle making network requests and parsing the response
protocol HTTPClient {
    /// Fetch and decode a HTTP resource to a given type
    func fetch<Output: Decodable>(resource: HTTPResource) -> AnyPublisher<Output, Error>
}
