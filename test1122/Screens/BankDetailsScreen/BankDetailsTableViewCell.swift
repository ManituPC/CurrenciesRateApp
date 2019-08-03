//
//  BankDetailTableViewCell.swift
//  test1122
//
//  Created by denis.chicherin on 7/13/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class BankDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var buySellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var bankDetails: Bank? {
        didSet {
            currencyLabel.text = bankDetails?.bankCurrency![rowIndex].0
            //FIX: convert Optoional double to string
            buySellLabel.text = "\(bankDetails?.bankCurrency![rowIndex].1)"
        }
    }
}
