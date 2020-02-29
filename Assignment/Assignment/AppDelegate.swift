//
//  AppDelegate.swift
//  Assignment
//
//  Created by Digvijay Joshi on 23/10/19.
//  Copyright © 2019 Digvijay Joshi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		return true
	
	}
	
	func applicationWillResignActive(_ application: UIApplication) {
	}
	
	func applicationDidEnterBackground(_ application: UIApplication) {
	}
	
	func applicationWillEnterForeground(_ application: UIApplication) {
	}
	
	func applicationDidBecomeActive(_ application: UIApplication) {
	}
	
	func applicationWillTerminate(_ application: UIApplication) {
	}
	
	
}

extension UIApplication {
	var statusBarView: UIView? {
		if responds(to: Selector(("statusBar"))) {
			return value(forKey: "statusBar") as? UIView
		}
		return nil
	}
}

