//
//  LoginTests.swift
//  LoginTests
//
//  Created by Nikolay Eckert on 22.09.2020.
//

import XCTest
@testable import Login

class ValidatorTests: XCTestCase {

	// MARK: - Check length
	
	func testCheckLengthLowerEdge() {
		let content: String = "qwe"
		let isValidLength: Bool = Validator.checkLength(content: content)
		
		XCTAssertEqual(isValidLength, true, "\(content.count) symbols length is invalid")
	}

	func testCheckLengthUpperEdge() {
		let content: String = "qwertyuiopasdfghjklzxcvbnmmnbvcx"
		let isValidLength: Bool = Validator.checkLength(content: content)
		
		XCTAssertEqual(isValidLength, true, "\(content.count) symbols length is invalid")
	}
	
	func testCheckLengthTooFewSymbols() {
		let content: String = "q"
		let isValidLength: Bool = Validator.checkLength(content: content)
		
		XCTAssertEqual(isValidLength, false, "\(content.count) symbols length is invalid")
	}
	
	func testCheckLengthTooManySymbols() {
		let content: String = "qwertyuiopasdfghjklzxcvbnmmnbvcxqwertyuiopasdfghjklzxcvbnmmnbvcx"
		let isValidLength: Bool = Validator.checkLength(content: content)
		
		XCTAssertEqual(isValidLength, false, "\(content.count) symbols length is invalid")
	}
}
