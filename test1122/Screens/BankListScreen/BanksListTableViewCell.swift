//
//  CityTableViewCell.swift
//  test1122
//
//  Created by denis.chicherin on 7/10/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class BanksListTableViewCell: UITableViewCell {

    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var bankAddress: UILabel!
    @IBOutlet weak var bankBuy: UILabel!
    @IBOutlet weak var bankSell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    var bank: Bank? {
//        didSet {
//            bankName.text = bank?.bankName
//            bankAddress.text = bank?.bankAddress
//            //FIX: convert Optoional double to string
//            bankBuy.text = "$ \(bank?.bankBuy)"
//            bankSell.text = "$ \(bank?.bankSell)"
//        }
//    }
    
    var bank: BankModel? {
        didSet {
            bankName.text = bank?.bankName
            bankAddress.text = bank?.address
            //FIX: convert Optoional double to string
            bankBuy.text = "$ 25.15)"
            bankSell.text = "$ 26.0)"
        }
    }
}
