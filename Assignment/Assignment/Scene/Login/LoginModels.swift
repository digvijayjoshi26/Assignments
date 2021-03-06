//
//  LoginModels.swift
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

enum Login
{
  
  enum LoginUser
  {
    struct Request
    {
    }
		struct Response:Codable
    {
			var bankAccount: String
			var agency: String
			var userId: String
			var name: String
			var balance: String
    }
    struct ViewModel
    {
			struct UserAccount: Equatable {
				var bankAccount: String
				var agency: String
				var userId: String
				var name: String
				var balance: String
			}
			
			var userAccount: UserAccount
    }
  }
}
