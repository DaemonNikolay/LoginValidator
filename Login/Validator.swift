//
//  Validator.swift
//  Login
//
//  Created by Nikolay Eckert on 22.09.2020.
//

protocol LoginValidator {
	static func checkLength(content: String) -> Bool
	static func checkFirstSymbol(firstSymbol: Character) -> Bool
	static func checkValidSymbols(content: String) -> Bool
}


struct Validator: LoginValidator {
	
	/// Valid range from 3 to 32
	static func checkLength(content: String) -> Bool {
		let isInvalid: Bool = content.count < 3 || content.count > 32
		
		return !isInvalid
	}
	
	/// - Warning: Don't use numbers, "." or "-"
	static func checkFirstSymbol(firstSymbol: Character) -> Bool {
		let isInvalidValid: Bool = firstSymbol.isNumber || firstSymbol == "." || firstSymbol == "-"
		
		return !isInvalidValid
	}
	
	/// Valid characters: "abcdefghijklmnopqrstuvwxyz1234567890-.@"
	///
	/// - Warning: Only one dot and only one minus
	static func checkValidSymbols(content: String) -> Bool {
		if content.filter({ $0 == "." }).count > 1 {
			return false
		}
		
		if content.filter({ $0 == "-" }).count > 1 {
			return false
		}
		
		let validSymbols = "abcdefghijklmnopqrstuvwxyz1234567890-.@"
	
		let contentLowerCased = content.lowercased()
		for symbol in contentLowerCased.map({ String($0) }) {
			if !validSymbols.contains(symbol) {
				return false
			}
		}
		
		return true
	}
}
