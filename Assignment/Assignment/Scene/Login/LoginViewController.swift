//
//  LoginViewController.swift
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

protocol LoginDisplayLogic: class
{
	func presentStatmentView(viewModel: Login.LoginUser.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic
{
  var interactor: LoginBusinessLogic?
  var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
	
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = LoginInteractor()
    let presenter = LoginPresenter()
    let router = LoginRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
	
	
	// MARK: IBActions
	
	@IBAction func handleLogin(_ sender: Any) {
		self.view.isUserInteractionEnabled = false
		self.view.endEditing(true)
		if (validateUser() == true) {
			saveCredentials()
			loginUser()
		}
		self.view.isUserInteractionEnabled = true
	}
	
	
	@IBAction func tappedOutside(_ sender: UITapGestureRecognizer) {
		self.view.endEditing(true)
	}
	
	
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
	
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
  }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		loadSavedCredential()
	}
  
  // MARK: Custom Methods
	
	func validateUser() -> Bool {
		guard let username = usernameTextField.text else {
			Utility.displayAlert(title: "Error", message: "Please enter username")
			return false
		}
		
		guard let password = passwordTextField.text else {
			Utility.displayAlert(title: "Error", message: "Please enter password")
			return false
		}
		
		if (username.isCPF == true ||
			username == "test_user" ||
			Utility.isValidEmailAddress(emailAddressString: username))
		{
			if (Utility.isValidPassword(password: password)) {
				return true
			} else {
				Utility.displayAlert(title: "Error", message: "Invalid password")
				return false
			}
		} else {
			Utility.displayAlert(title: "Error", message: "Invalid username")
			return false
		}
	}
	
	func loadSavedCredential() {
		let userDefault = UserDefaults.standard
		if let username = userDefault.value(forKey: "username"),
			let password = userDefault.value(forKey: "password") {
			usernameTextField.text = (username as! String)
			passwordTextField.text = (password as! String)
		}

		
	}
	
	func saveCredentials()
	{
		let username = usernameTextField.text
		let password = passwordTextField.text
		let userDefault = UserDefaults.standard
		userDefault.set(username, forKey: "username")
		userDefault.set(password, forKey: "password")
		userDefault.synchronize()
	}
	
  func loginUser()
  {
    let request = Login.LoginUser.Request()
    interactor?.loginProcess(request: request)
  }
	
	func saveUserAccountDetail(userAccount: Login.LoginUser.ViewModel.UserAccount)
	{
		
	}
	
	func navigateToStatementView()
	{
		performSegue(withIdentifier: "StatementView", sender: self)
	}
	
	func presentStatmentView(viewModel: Login.LoginUser.ViewModel)
	{
		DispatchQueue.main.async {
			self.view.isUserInteractionEnabled = true
		}
		let userAccount: Login.LoginUser.ViewModel.UserAccount = viewModel.userAccount
		saveUserAccountDetail(userAccount: userAccount)
		navigateToStatementView()
	}
	
}

extension LoginViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
}
