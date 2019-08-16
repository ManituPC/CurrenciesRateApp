//
//  SelectCurrencyViewController.swift
//  test1122
//
//  Created by denis.chicherin on 7/17/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class SelectCurrencyViewController: UIViewController {
    
    var userSettingsController = UserSettingsController()
    
    @IBOutlet weak var buttonUSD: CustomButton!
    @IBOutlet weak var buttonEUR: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonUSD.setTitle(NSLocalizedString("usd", tableName: "Localizable", comment: "comment"), for: .normal)
        buttonEUR.setTitle(NSLocalizedString("eur", tableName: "Localizable", comment: "comment"), for: .normal)
    }
    
    @IBAction func onClickUSD(_ sender: UIButton) {
        setDefaultCurrency(sender)
        showScreen()
    }
    
    @IBAction func onClickEUR(_ sender: UIButton) {
        setDefaultCurrency(sender)
        let viewC = self.navigationController?.viewControllers
        
        for view in viewC! {
            print(view)
        }
    }
    
    func setDefaultCurrency(_ button: UIButton) {
        if let buttonTitle = button.title(for: .normal) {
            userSettingsController.userSettings.selectedCurrency = buttonTitle
            print(buttonTitle)
        }
    }
    
    func showScreen() {
        let viewC = self.navigationController?.viewControllers
        
        for view in viewC! {
            print(view)
        }
        
        for index in viewC! {
            switch index {
            case is CitysListViewController:
                print("popTo")
                self.navigationController?.popToViewController((viewC?[0])!, animated: true)
            default:
                print("push")
                let viewController = storyboard?.instantiateViewController(withIdentifier: "CitysList")
                self.navigationController?.pushViewController(viewController!, animated: true)
            }
        }
    }
}
