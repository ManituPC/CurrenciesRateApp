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
    var cityArray = [City]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userSettingsController.loadDefaultCurrency()
        loadJSONDataAndGetInfo()
        
        //debug prints
        print("DEBUG: default currency is \(userSettingsController.userSettings.selectedCurrency)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    // MARK: screens navigation
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
    
    // MARK: get banks data from API
    func loadJSONDataAndGetInfo() {
        // get banks array from json data
        api.loadJSONData { (result) in
            switch result {
            case .success(let jsonDataResponse):
                self.jsonData = jsonDataResponse
                
                //get banksArray
                if let banks = self.jsonData?.organizations  {
                    self.banksArray = banks
                }
                
                //get city Dictionary
                if let dict = self.jsonData?.cities {
                    self.cityDict = dict
                    print("DEBUG: city dictionary: \n\(self.cityDict)")
                }
                
                //get citys list
                self.getCityArr()

                //get date
                self.getDate(jsonDataResponse: self.jsonData)
                
                //get bankId for city, city's currency(avarage, best buy and sell)
                self.sortBanksToCity()
                
                //refresh view
                self.refresh()
                
            case .failure(let error):
                print("Failed to fetch banks: ", error)
            }
        }
    }
    
    
    func refresh() { }
    
    // MARK: Get city array
    func getCityArr() {
        var cityNameArr = [String]()
        self.banksArray.forEach { bank in
            if let cityID = bank.cityId {
                if self.cityDict[cityID] != nil && cityNameArr.contains(self.cityDict[cityID]!) == false {
                    cityNameArr.append(self.cityDict[cityID]!)
                    var city = City()
                    city.cityName = self.cityDict[cityID]
                    self.cityArray.append(city)
                }
            }
        }
        print("DEBUG: city array: \n\(self.cityArray)")
    }
    
    // MARK: Get date
    func getDate(jsonDataResponse: ResponseData?) {
        if let date = jsonDataResponse?.date {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let newDate = dateFormatter.date(from: date)!
            dateFormatter.dateFormat = "MMM"
            let dateString = dateFormatter.string(from: newDate)
            print("DEBUG: date is: \(dateString)")
            
            for i in 0...self.cityArray.count - 1 {
                self.cityArray[i].monthName = dateString
            }
        }
    }
    
    // MARK: Sort banks to city and get some general value
    func sortBanksToCity() {
        if let curr = self.userSettingsController.userSettings.selectedCurrency {
            for i in 0 ..< self.cityArray.count {
                let city = self.cityArray[i]
                if let cityId = self.cityDict.first(where: {$0.value == city.cityName})?.key{
                    let filtered = self.banksArray.filter({$0.cityId == cityId}) //banks of current city
                    self.cityArray[i].bankIdArr = filtered.map {$0.id ?? ""} //write banks to id array
                    print("DEBUG: banks in city \(self.cityArray[i].cityName): \(self.cityArray[i].bankIdArr?.count)")
                    
                    //get avarage, best buy and sell
                    self.getAvarageBuySell(filteredBanksArr: filtered, curr: curr, index: i)
                    
                }
            }
        }
    }
    
    // MARK: Get avarage, best buy and best sell
    func getAvarageBuySell(filteredBanksArr: [BankModel], curr: String, index: Int) {
        var bestBuy = 0.0
        var bestSell = 0.0
        var avarage = 0.0
        var sumSell = 0.0
        var sumBuy = 0.0
        var arrSell = [Double]()
        var arrBuy = [Double]()
        
        for i in 0 ..< filteredBanksArr.count {
            if let value = filteredBanksArr[i].currencies[curr] {
                if let sumS = value.ask {
                    arrSell.append(Double(sumS) ?? 0.0)
                    sumSell += Double(sumS) ?? 0.0
                }
                if let sumB = value.bid {
                    arrBuy.append(Double(sumB) ?? 0.0)
                    sumBuy += Double(sumB) ?? 0.0
                }
            } else {
                print("DEBUG: Current currency is nil! \nDEBUG: Bank \(filteredBanksArr[i].bankName) have this currency: \(filteredBanksArr[i].currencies)")
            }
        }
        
        bestSell = arrSell.max() ?? 0.0
        bestBuy = arrBuy.max() ?? 0.0
        avarage = (sumSell + sumBuy) / Double(filteredBanksArr.count * 2)
        self.cityArray[index].bestBuyCost = bestBuy
        self.cityArray[index].bestSellCost = bestSell
        self.cityArray[index].bestAvarage = avarage
    }
}
