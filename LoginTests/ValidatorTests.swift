//
//  ValidatorTests.swift
//  ValidatorTests
//
//  Created by Nikolay Eckert on 22.09.2020.
//

import XCTest
@testable import Login

class ValidatorTests: XCTestCase {

	
	// MARK: - Check length
	
	func testCheckLengthLowerEdge() {
		let content: String = "qwe"
		let isValidLength: Bool = self.checkLength(content: content)
		
		XCTAssertEqual(isValidLength, true, "\(content.count) symbols length is invalid")
	}

	func testCheckLengthUpperEdge() {
		let content: String = "qwertyuiopasdfghjklzxcvbnmmnbvcx"
		let isValidLength: Bool = self.checkLength(content: content)
		
		XCTAssertEqual(isValidLength, true, "\(content.count) symbols length is invalid")
	}
	
	func testCheckLengthTooFewSymbols() {
		let content: String = "q"
		let isValidLength: Bool = self.checkLength(content: content)
		
		XCTAssertEqual(isValidLength, false, "\(content.count) symbols length is invalid")
	}
	
	func testCheckLengthTooManySymbols() {
		let content: String = "qwertyuiopasdfghjklzxcvbnmmnbvcxqwertyuiopasdfghjklzxcvbnmmnbvcx"
		let isValidLength: Bool = self.checkLength(content: content)
		
		XCTAssertEqual(isValidLength, false, "\(content.count) symbols length is invalid")
	}
	
	private func checkLength(content: String) -> Bool {
		Validator.checkLength(content: content)
	}
	
	
	// MARK: - Check first symbol
	
	func testCheckValidSymbol() {
		let firstSymbol: Character = "j"
		let isValidFirstSymbol: Bool = self.checkFirstSymbol(firstSymbol)
		
		XCTAssertEqual(isValidFirstSymbol, true, "Symbol '\(firstSymbol)' is invalid")
	}
	
	func testCheckInvalidFirstSymbolDot() {
		let firstSymbol: Character = "."
		let isValidFirstSymbol: Bool = self.checkFirstSymbol(firstSymbol)
		
		XCTAssertEqual(isValidFirstSymbol, false, "Symbol '\(firstSymbol)' is invalid")
	}
	
	func testCheckInvalidFirstSymbolMinus() {
		let firstSymbol: Character = "-"
		let isValidFirstSymbol: Bool = self.checkFirstSymbol(firstSymbol)
		
		XCTAssertEqual(isValidFirstSymbol, false, "Symbol '\(firstSymbol)' is invalid")
	}
	
	func testCheckInvalidFirstSymbolNumberZero() {
		let firstSymbol: Character = "0"
		let isValidFirstSymbol: Bool = self.checkFirstSymbol(firstSymbol)
		
		XCTAssertEqual(isValidFirstSymbol, false, "Symbol '\(firstSymbol)' is invalid")
	}
	
	func testCheckInvalidFirstSymbolNumberFive() {
		let firstSymbol: Character = "5"
		let isValidFirstSymbol: Bool = self.checkFirstSymbol(firstSymbol)
		
		XCTAssertEqual(isValidFirstSymbol, false, "Symbol '\(firstSymbol)' is invalid")
	}
	
	private func checkFirstSymbol(_ firstSymbol: Character) -> Bool {
		Validator.checkFirstSymbol(firstSymbol: firstSymbol)
	}
	
	
	// MARK: - Check valid symbols
	
	func testCheckValidSymbolsNicknameMarmok() {
		let content: String = "Mr.Marmok"
		let isValidSymbols: Bool = self.checkValidSymbols(content: content)
		
		XCTAssertEqual(isValidSymbols, true, "Line \(content) is invalid")
	}
	
	func testCheckValidSymbolsNicknameNikulux() {
		let content: String = "Nikulux"
		let isValidSymbols: Bool = self.checkValidSymbols(content: content)
		
		XCTAssertEqual(isValidSymbols, true, "Line \(content) is invalid")
	}
	
	func testCheckValidSymbolsEmail() {
		let content: String = "example@yandex.ru"
		let isValidSymbols: Bool = self.checkValidSymbols(content: content)
		
		XCTAssertEqual(isValidSymbols, true, "Line \(content) is invalid")
	}
	
	func testCheckValidSymbolsOneDots() {
		let content: String = "One.Dots"
		let isValidSymbols: Bool = self.checkValidSymbols(content: content)
		
		XCTAssertEqual(isValidSymbols, true, "Line \(content) is invalid")
	}
	
	func testCheckValidSymbolsOnlyNumbers() {
		let content: String = "58457398279328543983"
		let isValidSymbols: Bool = self.checkValidSymbols(content: content)
		
		XCTAssertEqual(isValidSymbols, true, "Line \(content) is invalid")
	}
	
	func testCheckValidSymbolsOneMinus() {
		let content: String = "One-minus"
		let isValidSymbols: Bool = self.checkValidSymbols(content: content)
		
		XCTAssertEqual(isValidSymbols, true, "Line \(content) is invalid")
	}
	
	func testCheckValidSymbolsOnlyLatin() {
		let content: String = "qwertyuiopasdfghjklzxcvbnm"
		let isValidSymbols: Bool = self.checkValidSymbols(content: content)
		
		XCTAssertEqual(isValidSymbols, true, "Line \(content) is invalid")
	}
	
	func testCheckValidSymbolsLatinAndNumbers() {
		let content: String = "q1w2e3r4t5y6u7i8o9pa0s10d489f59ghjklzxcvbnm4548556"
		let isValidSymbols: Bool = self.checkValidSymbols(content: content)
		
		XCTAssertEqual(isValidSymbols, true, "Line \(content) is invalid")
	}
	
	func testCheckInvalidSymbolsManyDots() {
		let content: String = "jfids..fjidroew"
		let isValidSymbols: Bool = self.checkValidSymbols(content: content)
		
		XCTAssertEqual(isValidSymbols, false, "Line \(content) is invalid")
	}
	
	func testCheckInvalidSymbolsManyMinus() {
		let content: String = "-many-minus-"
		let isValidSymbols: Bool = self.checkValidSymbols(content: content)
		
		XCTAssertEqual(isValidSymbols, false, "Line \(content) is invalid")
	}
	
	func testCheckInvalidSymbolsNotOnlyLatin() {
		let content: String = "gjfidoоаушщкщукjfoiew"
		let isValidSymbols: Bool = self.checkValidSymbols(content: content)
		
		XCTAssertEqual(isValidSymbols, false, "Line \(content) is invalid")
	}
	
	private func checkValidSymbols(content: String) -> Bool {
		Validator.checkValidSymbols(content: content)
	}
}
