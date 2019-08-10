//
//  SelectCurrencyViewController.swift
//  test1122
//
//  Created by denis.chicherin on 7/17/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class SelectCurrencyViewController: UIViewController {
    
    var selectedCurrency: String!
    var userSettingsController: UserSettingsController!
    
    @IBOutlet weak var buttonUSD: CustomButton!
    @IBOutlet weak var buttonEUR: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonUSD.setTitle(NSLocalizedString("usd", tableName: "Localizable", comment: "comment"), for: .normal)
        buttonEUR.setTitle(NSLocalizedString("eur", tableName: "Localizable", comment: "comment"), for: .normal)
    }
    
    @IBAction func onClickUSD(_ sender: UIButton) {
        print(sender.currentTitle)

    }
    
    @IBAction func onClickEUR(_ sender: UIButton) {
            print(sender.currentTitle)
    }
}
