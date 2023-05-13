//
//  HTTPClientStub.swift
//  DummyAppTests
//
//  Created by Russell Yeo on 13/05/2023.
//

import Combine
import Foundation
@testable import DummyApp

final class HTTPClientMock<Output>: HTTPClient {
    
   // MARK: - fetch<Output: Decodable>

    var fetchResourceCallsCount = 0
    var fetchResourceCalled: Bool {
        fetchResourceCallsCount > 0
    }
    var fetchResourceReceivedResource: HTTPResource?
    var fetchResourceReceivedInvocations: [HTTPResource] = []
    var fetchResponse: AnyPublisher<Output, Error>?

    func fetch<Output: Decodable>(resource: HTTPResource) -> AnyPublisher<Output, Error> {
        fetchResourceCallsCount += 1
        fetchResourceReceivedResource = resource
        fetchResourceReceivedInvocations.append(resource)
        return fetchResponse as! AnyPublisher<Output, Error>
    }

}
