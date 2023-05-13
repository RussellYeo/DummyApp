//
//  HTTPResource.swift
//  DummyApp
//
//  Created by Russell Yeo on 13/05/2023.
//

import Foundation
 
/// A resource that represents an HTTP request
struct HTTPResource {
    /// The path for the HTTP request
    let path: String
    /// The query parameters for the HTTP request
    let queryItems: Array<URLQueryItem>
    /// A closure that checks the status code of the HTTP response
    let checkStatusCode: (Int) -> Bool
}
