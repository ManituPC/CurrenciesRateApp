//
//  CityTableViewCell.swift
//  firstApp
//
//  Created by denis.chicherin on 7/9/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewController {

	@IBOutlet weak var cityImageView: UIImageView!
	@IBOutlet weak var titleLabel_1: UILabel!
	@IBOutlet weak var titleLabel_2: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
    	super.setSelected(selected, animated: animated)

    	// Configure the view for the selected state
    }
}

