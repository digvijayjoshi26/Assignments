//
//  String+CPF.swift
//  Assignment
//
//  Created by Digvijay Joshi on 03/11/19.
//  Copyright © 2019 Digvijay Joshi. All rights reserved.
//

import Foundation

extension String {
	
	/// Check if username is a CPF number
	///
	/// - returns: Boolean: TRUE if yes other wise FALSE
	
	
	var isCPF: Bool {
		let cpf = self.onlyNumbers()
		guard cpf.count == 11 else { return false }
		
		let i1 = cpf.index(cpf.startIndex, offsetBy: 9)
		let i2 = cpf.index(cpf.startIndex, offsetBy: 10)
		let i3 = cpf.index(cpf.startIndex, offsetBy: 11)
		let d1 = Int(cpf[i1..<i2])
		let d2 = Int(cpf[i2..<i3])
		
		var temp1 = 0, temp2 = 0
		
		for i in 0...8 {
			let start = cpf.index(cpf.startIndex, offsetBy: i)
			let end = cpf.index(cpf.startIndex, offsetBy: i+1)
			let char = Int(cpf[start..<end])
			
			temp1 += char! * (10 - i)
			temp2 += char! * (11 - i)
		}
		
		temp1 %= 11
		temp1 = temp1 < 2 ? 0 : 11-temp1
		
		temp2 += temp1 * 2
		temp2 %= 11
		temp2 = temp2 < 2 ? 0 : 11-temp2
		
		return temp1 == d1 && temp2 == d2
	}
	
	private func onlyNumbers() -> String {
		guard !isEmpty else { return "" }
		return replacingOccurrences(of: "\\D",
																with: "",
																options: .regularExpression,
																range: startIndex..<endIndex)
	}
	
}
