//
//  CityTableViewCell.swift
//  test1122
//
//  Created by denis.chicherin on 7/10/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class BankListTableViewCell: UITableViewCell {

    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var labelText_1: UILabel!
    @IBOutlet weak var labelText_2: UILabel!
    @IBOutlet weak var lableText_3: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
