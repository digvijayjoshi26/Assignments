//
//  Utility.swift
//  Assignment
//
//  Created by Digvijay Joshi on 26/10/19.
//  Copyright © 2019 Digvijay Joshi. All rights reserved.
//

import UIKit

import JGProgressHUD

class Utility: NSObject {
	
	static func isValidEmailAddress(emailAddressString: String) -> Bool {
		
		var returnValue = true
		let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
		
		do {
			let regex = try NSRegularExpression(pattern: emailRegEx)
			let nsString = emailAddressString as NSString
			let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
			
			if results.count == 0
			{
				returnValue = false
			}
			
		} catch let error as NSError {
			print("invalid regex: \(error.localizedDescription)")
			returnValue = false
		}
		
		return  returnValue
	}
	
	static func isValidPassword(password: String) -> Bool {
		let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{4,10}"
		let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
		return passwordPredicate.evaluate(with: password)
	}
	
	static func displayAlert(title: String, message: String) {
		DispatchQueue.main.async {
			let alert = UIAlertController(title: title, message:message, preferredStyle: UIAlertController.Style.alert)
			
			alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
			
			let alertWindow = UIWindow(frame: UIScreen.main.bounds)
			alertWindow.rootViewController = UIViewController()
			alertWindow.windowLevel = UIWindow.Level.alert + 1;
			alertWindow.makeKeyAndVisible()
			alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
		}	
	}
	
}
