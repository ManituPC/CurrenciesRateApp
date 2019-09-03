//
//  BaseViewController.swift
//  test1122
//
//  Created by denis.chicherin on 8/29/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var userSettingsController = UserSettingsController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userSettingsController.loadDefaultCurrency()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("default currency is \(userSettingsController.userSettings.selectedCurrency)")
        
        
        //test API response
        let api = APIManager()
        api.loadData { (result) in
            switch result {
            case .success(let banksArray):
                banksArray.forEach({ (bank) in
                    print(bank.address)
                })
            case .failure(let error):
                print("Failed to fetch banks: ", error)
            }
        }
    }
    
    func showScreen(name: String) {
        
        let viewC = self.navigationController?.viewControllers
        
        // for debug
        for view in viewC! {
            print(view)
        }
        
        switch name {
        case "Main":
            if let destinationVC = viewC?[0] as? CitysListViewController  {
                print("popTo \(destinationVC)")
                self.navigationController?.popToViewController(destinationVC, animated: true)
            } else {
                print("push")
                let viewController = storyboard?.instantiateViewController(withIdentifier: name)
                self.navigationController?.pushViewController(viewController!, animated: true)
            }
            
        case "SelectCurrencyNav":
            if let destinationVC = viewC?[0] as? SelectCurrencyViewController  {
                print("popTo \(destinationVC)")
                self.navigationController?.popToViewController(destinationVC, animated: true)
            } else {
                print("push")
                let viewController = storyboard?.instantiateViewController(withIdentifier: name)
                self.navigationController?.pushViewController(viewController!, animated: true)
            }
            
        default: print("empty")
        }
        
    }
}
