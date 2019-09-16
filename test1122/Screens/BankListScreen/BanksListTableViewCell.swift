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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    var currency: String?
    var buy = 0.0
    var sell = 0.0
    var symbol: String {
        switch currency {
        case "EUR":
            return "€"
        case "USD":
            return "$"
        default:
            return " "
        }
    }
    
    var bank: BankModel? {
        didSet {
            bankName.text = bank?.bankName
            bankAddress.text = bank?.address
            if let strBuy = bank?.currencies[currency!]?.bid {
                buy = Double(strBuy) as! Double
            }
            bankBuy.text = "\(String(describing: symbol)) \(String(format:"%.2f", (buy)))"
            if let strSell = bank?.currencies[currency!]?.ask {
                sell = Double(strSell) as! Double
            }
            bankSell.text = "\(String(describing: symbol)) \(String(format:"%.2f", (sell)))"
        }
    }
}
