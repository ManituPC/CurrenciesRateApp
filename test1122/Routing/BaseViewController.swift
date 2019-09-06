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
    var jsonData: ResponseData?
    var banksArray = [BankModel]()
    var cityDict = [String: String]()
    var cityArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userSettingsController.loadDefaultCurrency()
        loadJSONData()
        
        
        //debug prints
        print("DEBUG: default currency is \(userSettingsController.userSettings.selectedCurrency)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadB()
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
    func loadJSONData() {
        // get banks array from json data
        api.loadJSONData { (result) in
            switch result {
            case .success(let jsonDataResponse):
                self.jsonData = jsonDataResponse
                
                //get banksArray
                if let banks = jsonDataResponse.organizations  {
                    self.banksArray = banks
                }
                
                //get city Dictionary
                if let dict = self.jsonData?.cities {
                    self.cityDict = dict
                    print("DEBUG: city dictionary: \n\(self.cityDict)")
                }
                
                //get citys list
                self.banksArray.forEach { city in
                    if let cityID = city.cityId {
                        if self.cityDict[cityID] != nil && self.cityArray.contains(self.cityDict[cityID]!) == false {
                            self.cityArray.append(self.cityDict[cityID]!)
                        }
                    }
                }
                print("DEBUG: city array: \n\(self.cityArray)")
                
                
//                for bank in self.banksArray {
//                    if let str = bank.cityId {
//                        for str in jsonData?.cities {
//                            switch str {
//                            case
//                            }
//                        }
//
//                    }
//                }
                
                self.refresh()
                //print("DEBUG: inside BaseView JSON: \n\(String(describing: self.jsonData))")
            case .failure(let error):
                print("Failed to fetch banks: ", error)
            }
        }
    }
    
    func loadB() {
        if let banks = jsonData?.organizations  {
            self.banksArray = banks
        }
        
        self.refresh()
        print("DEBUG: inside BaseView banks count = \(self.banksArray.count)")
    }
    
    func loadBanksData() {
        // get banks array from json data
        api.loadBanksData { (result) in
            switch result {
            case .success(let banksArrayResponse):
                self.banksArray = banksArrayResponse
                self.refresh()
                print("DEBUG: inside BaseView banks count = \(self.banksArray.count)")
            case .failure(let error):
                print("Failed to fetch banks: ", error)
            }
        }
    }
    
    func refresh() { }
}
