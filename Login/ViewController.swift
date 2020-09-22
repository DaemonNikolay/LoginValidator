//
//  ViewController.swift
//  Login
//
//  Created by Nikolay Eckert on 22.09.2020.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet var loginTextField: UITextField!
	@IBOutlet var errorMessageLabel: UILabel!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		self.setDefaultErrorMessage()
		
		self.settingLoginTextField()
	}
	
	private func settingLoginTextField() {
		self.loginTextField.layer.borderWidth = 1
		self.loginTextField.layer.cornerRadius = 5
		
		self.loginTextField.addTarget(self,
									  action: #selector(ViewController.textFieldDidChange(_:)),
									  for: .editingChanged)
	}
	
	@objc func textFieldDidChange(_ textField: UITextField) {
		guard let content = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
		
		if !Validator.checkLength(content: content)  {
			self.displayErrorMessage("Нарушено правило №2")
			
			return
		}
		
		guard let firstSymbol: Character = content.first else { return }
		if !Validator.checkFirstSymbol(firstSymbol: firstSymbol) {
			self.displayErrorMessage("Нарушено правило №4")
			
			return
		}
		
		if !Validator.checkValidSymbols(content: content) {
			self.displayErrorMessage("Нарушено правило №3")
			
			return
		}
		
		self.setDefaultErrorMessage()
	}
	
	
	// MARK: - UI messages
	
	private func displayErrorMessage(_ message: String) {
		self.loginTextField.layer.borderColor = UIColor.red.cgColor
		self.errorMessageLabel.text = message
	}
	
	private func setDefaultErrorMessage() {
		self.loginTextField.layer.borderColor = UIColor.gray.cgColor
		self.errorMessageLabel.text = ""
	}
}
