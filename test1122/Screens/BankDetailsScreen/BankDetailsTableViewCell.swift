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
    
    var bankDetails: (String, CurrencyModel?)? {
        didSet {
            let string = bankDetails?.0
            currencyLabel.text = string
            let strBid = bankDetails?.1?.bid ?? "0.0"
            let strAsk = bankDetails?.1?.ask ?? "0.0"
            let bid = Double(strBid)!
            let ask = Double(strAsk)!
            buySellLabel.text = "\(String(format: "%.2f", (bid))) / \(String(format: "%.2f", (ask)))"
        }
    }
}
