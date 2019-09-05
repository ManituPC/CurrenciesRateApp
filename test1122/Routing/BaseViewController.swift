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
    let api = APIManager()
    var banksArray = [BankModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userSettingsController.loadDefaultCurrency()
        loadBanksData()
        
        //debug prints
        print("DEBUG: default currency is \(userSettingsController.userSettings.selectedCurrency)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // screens navigation
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
    
    //MARK: get banks data from API
    func loadBanksData() {
        // get banks array from json data
        api.loadData { (result) in
            switch result {
            case .success(let banksArrayResponse):
                self.banksArray = banksArrayResponse
//                banksArrayResponse.forEach({ (bank) in
//                    self.banksArray.append(bank)
//                })
                self.refresh()
                print("DEBUG: inside BaseView banks count = \(self.banksArray.count)")
            case .failure(let error):
                print("Failed to fetch banks: ", error)
            }
        }
    }
    
    func refresh() { }
}
