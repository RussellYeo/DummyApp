//
//  NumberFormatterClient.swift
//  DummyApp
//
//  Created by Russell Yeo on 12/06/2023.
//

import Dependencies
import Foundation

struct NumberFormatterClient {
    /// Update the number formatter style
    var setNumberStyle: (NumberFormatter.Style) -> ()
    /// Produce a string from a decimal number
    var string: (_ from: NSDecimalNumber) -> String?
}

extension NumberFormatterClient {
    static var live: Self {
        let formatter = NumberFormatter()
        return Self(
            setNumberStyle: { formatter.numberStyle = $0 },
            string: formatter.string
        )
    }
    
    static var USD: Self {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .init(identifier: "en_US")
        formatter.currencyCode = "USD"
        return Self(
            setNumberStyle: { _ in },
            string: formatter.string
        )
    }
}

private enum NumberFormatterClientKey: DependencyKey {
    static let liveValue = NumberFormatterClient.live
    static let previewValue = NumberFormatterClient.USD
}

extension DependencyValues {
    var numberFormatter: NumberFormatterClient {
        get { self[NumberFormatterClientKey.self] }
        set { self[NumberFormatterClientKey.self] = newValue }
    }
}
