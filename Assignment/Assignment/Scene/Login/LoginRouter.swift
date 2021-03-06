//
//  LoginRouter.swift
//  Assignment
//
//  Created by Digvijay Joshi on 26/10/19.
//  Copyright (c) 2019 Digvijay Joshi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol LoginRoutingLogic
{
	func routeToStatementView(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing
{
  var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
  weak var viewController: LoginViewController?
  var dataStore: LoginDataStore?
  
  // MARK: Routing
	
	func routeToStatementView(segue: UIStoryboardSegue?)
	{
		if let segue = segue {
			let destinationVC = segue.destination as! StatementViewController
			var destinationDS = destinationVC.router!.dataStore!
			passDataToStatementView(source: dataStore!, destination: &destinationDS)
		} else {
			let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "StatementViewController") as! StatementViewController
			var destinationDS = destinationVC.router!.dataStore!
			passDataToStatementView(source: dataStore!, destination: &destinationDS)
			navigateToStatementView(source: viewController!, destination: destinationVC)
		}
	}

  // MARK: Navigation
	
	func navigateToStatementView(source: LoginViewController, destination: StatementViewController)
	{
		//source.show(destination, sender: nil)
	}
	
  // MARK: Passing data
	
	func passDataToStatementView(source: LoginDataStore, destination: inout StatementDataStore)
	{
		destination.userAccount = source.userAccount
	}

}
