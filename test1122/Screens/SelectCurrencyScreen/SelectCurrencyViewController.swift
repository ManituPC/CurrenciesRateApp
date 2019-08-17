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
        
        let name = "CitysList"
        let viewC = self.navigationController?.viewControllers
        
        for view in viewC! {
            print(view)
        }
        
        if let destinationVC = viewC?[0] as? CitysListViewController  {
            print("popTo")
            self.navigationController?.popToViewController(destinationVC, animated: true)
        } else {
            print("push")
            let viewController = storyboard?.instantiateViewController(withIdentifier: name)
            self.navigationController?.pushViewController(viewController!, animated: true)
        }
    }
}
