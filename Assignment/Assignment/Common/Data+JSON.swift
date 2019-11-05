//
//  Data+JSON.swift
//  Assignment
//
//  Created by Digvijay Joshi on 23/10/19.
//  Copyright © 2019 Digvijay Joshi. All rights reserved.
//

import Foundation

extension Data {
	
	/// Deserializing this data object into a json dictionary if possible
	///
	/// - returns: The deserialized dictionary if possible, otherwise nil
	
	func jsonDictionary() -> [String: Any]? {
		
		do {
			let json : AnyObject! = try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject

			return json as? [String : Any]
			
		} catch {
			
			return nil
		}
	}
	
}
