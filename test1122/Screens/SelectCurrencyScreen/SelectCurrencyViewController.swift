//
//  SelectCurrencyViewController.swift
//  test1122
//
//  Created by denis.chicherin on 7/17/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class SelectCurrencyViewController: BaseViewController {
        
    @IBOutlet weak var buttonUSD: CurrencyButton!
    @IBOutlet weak var buttonEUR: CurrencyButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonUSD.setTitle(Localizable.Common.usd.localized, for: .normal)
        buttonEUR.setTitle(Localizable.Common.eur.localized, for: .normal)
    }
    
    @IBAction func onClickUSD(_ sender: UIButton) {
        setDefaultCurrency(sender)
        showScreen(name: "Main")
    }
    
    @IBAction func onClickEUR(_ sender: UIButton) {
        setDefaultCurrency(sender)
        showScreen(name: "Main")
    }
    
    func setDefaultCurrency(_ button: UIButton) {
        if let buttonTitle = button.title(for: .normal) {
            userSettingsController.saveDefaultCurrency(currency: buttonTitle)
            print(buttonTitle)
        }
    }
}
