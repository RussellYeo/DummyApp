//
//  CartStorage.swift
//  DummyAppTests
//
//  Created by Russell Yeo on 13/05/2023.
//

@testable import DummyApp
import XCTest

final class CartStorageTests: XCTestCase {
    var cart: CartStorage!
    
    override func setUp() {
        super.setUp()
        cart = CartStorage()
    }
    
    override func tearDown() {
        cart = nil
        super.tearDown()
    }
    
    func testAddProduct() {
        let product1: Product = ProductDTO.iPhoneX.model
        let product2: Product = ProductDTO.samsungUniverse.model
         
        cart.add(product: product1)
        XCTAssertEqual(cart.products, [product1: 1])
        XCTAssertEqual(cart.totalPrice, 899)
        XCTAssertEqual(cart.totalProducts, 1)
        XCTAssertEqual(cart.totalQuantity, 1)
        
        cart.add(product: product1)
        XCTAssertEqual(cart.products, [product1: 2])
        XCTAssertEqual(cart.totalPrice, 1798)
        XCTAssertEqual(cart.totalProducts, 1)
        XCTAssertEqual(cart.totalQuantity, 2)
        
        cart.add(product: product2)
        XCTAssertEqual(cart.products, [product1: 2, product2: 1])
        XCTAssertEqual(cart.totalPrice, 3047)
        XCTAssertEqual(cart.totalProducts, 2)
        XCTAssertEqual(cart.totalQuantity, 3)
    }
}
