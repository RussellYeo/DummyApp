//
//  NumberFormatterClient.swift
//  DummyApp
//
//  Created by Russell Yeo on 12/06/2023.
//

import Dependencies
import Foundation

public struct NumberFormatterClient {
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
    
    public static var USD: Self {
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

extension DependencyValues {
    public var numberFormatter: NumberFormatterClient {
        get { self[NumberFormatterClient.self] }
        set { self[NumberFormatterClient.self] = newValue }
    }
}

extension NumberFormatterClient: DependencyKey {
    public static let liveValue: NumberFormatterClient = .live
}

extension NumberFormatterClient: TestDependencyKey {
    public static let previewValue: NumberFormatterClient = .noop
    
    public static var testValue: Self {
        return Self(
            setNumberStyle: unimplemented("\(Self.self).setNumberStyle"),
            string: unimplemented("\(Self.self).string")
        )
    }
    
    static var noop: Self {
        return Self(
            setNumberStyle: { _ in },
            string: { _ in "" }
        )
    }
}
