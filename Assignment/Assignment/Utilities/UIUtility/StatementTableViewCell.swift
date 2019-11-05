//
//  StatementTableViewCell.swift
//  Assignment
//
//  Created by Digvijay Joshi on 25/10/19.
//  Copyright © 2019 Digvijay Joshi. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var valueLabel: UILabel!
	
	
	func configureCellWith(transaction: Statement.FetchStatement.ViewModel.Transaction) {
		self.titleLabel.text = transaction.title
		self.dateLabel.text = transaction.date
		self.descriptionLabel.text = transaction.desc
		self.valueLabel.text = transaction.value.description
	}
	
}
