//
//  StatementInteractor.swift
//  Assignment
//
//  Created by Digvijay Joshi on 23/10/19.
//  Copyright (c) 2019 Digvijay Joshi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol StatementBusinessLogic
{
  func fetchStatement(request: Statement.FetchStatement.Request)
	func getUserAccount(request: Statement.GetUserAccount.Request)
}

protocol StatementDataStore
{
  var userAccount: UserAccount! { get set }
}

class StatementInteractor: StatementBusinessLogic, StatementDataStore
{
	var userAccount: UserAccount!
	
	var presenter: StatementPresentationLogic?
  var worker: StatementWorker?
	
  func fetchStatement(request: Statement.FetchStatement.Request)
	{
		worker = StatementWorker()
		worker?.fetchStatement(completion: { (response , error) in
			if let responseData = response{
				self.presenter?.presentStatement(response: responseData)
			}else{
				print("error")
			}
		})
		
	}
	
	func getUserAccount(request: Statement.GetUserAccount.Request)
	{
			let response = Statement.GetUserAccount.Response(userAccount: userAccount)
			presenter?.presentUserAccount(response: response)
	}
		
}
