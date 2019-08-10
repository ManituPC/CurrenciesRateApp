//
//  BankDetailTableViewCell.swift
//  test1122
//
//  Created by denis.chicherin on 7/13/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class BankDetailsTableViewCell: UITableViewCell {

	// TODO: add outlets

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var bank: Bank? {
        didSet {
        	// FIX: add string from res 
            bankCurrency.text = "USD"
            //FIX: convert Optoional double to string
            bankBuy.text = "$ \(bank?.bankBuy)"
            bankSell.text = "$ \(bank?.bankSell)"
        }
    }
}
