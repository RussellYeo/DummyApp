//
//  CartStorageTests.swift
//  DummyAPITests
//
//  Created by Russell Yeo on 13/05/2023.
//

import DummyAPI
@testable import DummyAPILive
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
        let product1 = Product.iPhoneX
        let product2 = Product.samsungUniverse
         
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
    
    
    func testUpdateWithExistingProduct() {
        // GIVEN a cart with a product
        let product = Product.iPhoneX
        cart.add(product: product)
        
        // WHEN we update the quantity of the product
        let updated = cart.update(product: product, quantity: 2)
        
        // THEN the cart is updated
        XCTAssertTrue(updated)
        XCTAssertEqual(cart.products[product], 2)
        XCTAssertEqual(cart.totalPrice, 1798)
        XCTAssertEqual(cart.totalProducts, 1)
        XCTAssertEqual(cart.totalQuantity, 2)
    }

    func testUpdateWithNonExistingProduct() {
        // GIVEN a cart with a product
        let product1 = Product.iPhoneX
        cart.add(product: product1)

        // WHEN we update the quantity of a non existing product
        let product2 = Product.iPhone9
        let updated = cart.update(product: product2, quantity: 2)

        // THEN the cart is not updated
        XCTAssertFalse(updated)
        XCTAssertEqual(cart.products[product2], nil)
        XCTAssertEqual(cart.totalPrice, 899)
        XCTAssertEqual(cart.totalProducts, 1)
        XCTAssertEqual(cart.totalQuantity, 1)
    }

    func testUpdateWithSameQuantity() {
        // GIVEN a cart with a product
        let product = Product.iPhoneX
        cart.add(product: product)

        // WHEN we update the cart with the same quantity
        let updated = cart.update(product: product, quantity: 1)

        // THEN the cart is not updated
        XCTAssertFalse(updated)
        XCTAssertEqual(cart.products[product], 1)
        XCTAssertEqual(cart.totalPrice, 899)
        XCTAssertEqual(cart.totalProducts, 1)
        XCTAssertEqual(cart.totalQuantity, 1)
    }
}
