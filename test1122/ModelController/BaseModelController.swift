//
//  BaseModelController.swift
//  test1122
//
//  Created by denis.chicherin on 9/11/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import Foundation
import UIKit


class BaseModelController: UserSettingsController {
    
    var userSettingsController = UserSettingsController()
    let api = APIManager()
    var jsonData: ResponseData?
    var banksArray = [BankModel]()
    var cityDict = [String: String]()
    var cityArray = [City]()
    
    // MARK: get banks data from API
    func loadJSONDataAndGetInfo(refresh: @escaping () -> ()) {
        userSettingsController.loadDefaultCurrency()
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
                refresh()
                
            case .failure(let error):
                print("Failed to fetch banks: ", error)
            }
        }
    }
    
    // MARK: Get city array
    func getCityArr() {
        var cityNameArr = [String]()
        self.banksArray.forEach { bank in
            if let cityID = bank.cityId {
                if self.cityDict[cityID] != nil && cityNameArr.contains(self.cityDict[cityID]!) == false {
                    cityNameArr.append(self.cityDict[cityID]!)
                }
            }
        }
        self.cityArray = cityNameArr.map({ (name) -> City in
            var city = City()
            city.cityName = name
            return city
        })
        
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
        if let curr = userSettingsController.userSettings.selectedCurrency {
            for i in 0 ..< self.cityArray.count {
                let city = self.cityArray[i]
                if let cityId = self.cityDict.first(where: {$0.value == city.cityName})?.key{
                    let filtered = self.banksArray.filter({$0.cityId == cityId}) //banksArr for current city
                    self.cityArray[i].banksArr = filtered.map {$0.self} //write banks to id array
                    print("DEBUG: banks in city \(self.cityArray[i].cityName): \(self.cityArray[i].banksArr?.count)")
                    
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
        var tupleBuySell = (buy: [Double](), sell: [Double]())
        var tupleSum = (sumBuy: Double(), sumSell: Double())

        tupleBuySell = sortBuySellValue(filteredBanksArr: filteredBanksArr, curr: curr)
        tupleSum = calcAmount(filteredBanksArr: filteredBanksArr, curr: curr)
                
        bestSell = tupleBuySell.sell.max() ?? 0.0
        bestBuy = tupleBuySell.buy.max() ?? 0.0
        avarage = (tupleSum.sumSell + tupleSum.sumBuy) / Double(filteredBanksArr.count * 2)
        self.cityArray[index].bestBuyCost = bestBuy
        self.cityArray[index].bestSellCost = bestSell
        self.cityArray[index].bestAvarage = avarage
    }
    
    // MARK: Get sorted Buy and Sell value
    func sortBuySellValue(filteredBanksArr: [BankModel], curr: String) -> (buy: [Double], sell: [Double]) {
        var arrSell = [Double]()
        var arrBuy = [Double]()
        
        for i in 0 ..< filteredBanksArr.count {
            if let value = filteredBanksArr[i].currencies[curr] {
                if let sumS = value.ask {
                    arrSell.append(Double(sumS) ?? 0.0)
                }
                if let sumB = value.bid {
                    arrBuy.append(Double(sumB) ?? 0.0)
                }
            } else {
                print("DEBUG: Current currency is nil! \nDEBUG: Bank \(filteredBanksArr[i].bankName) have this currency: \(filteredBanksArr[i].currencies)")
            }
        }
        return (buy: arrBuy, sell: arrSell)
    }
    
    // MARK: Calculate avarege
    func calcAmount(filteredBanksArr: [BankModel], curr: String) -> (sumBuy: Double, sumSell: Double) {
        var sumSell = 0.0
        var sumBuy = 0.0
        
        for i in 0 ..< filteredBanksArr.count {
            if let value = filteredBanksArr[i].currencies[curr] {
                if let sumS = value.ask {
                    sumSell += Double(sumS) ?? 0.0
                }
                if let sumB = value.bid {
                    sumBuy += Double(sumB) ?? 0.0
                }
            } else {
                print("DEBUG: Current currency is nil! \nDEBUG: Bank \(filteredBanksArr[i].bankName) have this currency: \(filteredBanksArr[i].currencies)")
            }
        }
        
        return (sumBuy, sumSell)
    }
    
    func sortBankByBuySell(banksArr: [BankModel], curr: String) -> (buy: [BankModel], sell: [BankModel]) {
        var banksArrSell = [BankModel]()
        var banksArrBuy = [BankModel]()
        
        let filtered = banksArr.filter({$0.currencies[curr] != nil})

        banksArrSell = filtered.sorted(by: {(bank0: BankModel, bank1: BankModel) -> Bool in
            return (Double((bank0.currencies[curr]?.ask)!)! - Double((bank1.currencies[curr]?.ask)!)!) < 0
        })
        
        banksArrBuy = filtered.sorted(by: {(bank0: BankModel, bank1: BankModel) -> Bool in
            return (Double((bank0.currencies[curr]?.bid)!)! - Double((bank1.currencies[curr]?.bid)!)!) > 0
        })
        
        return (buy: banksArrBuy, sell: banksArrSell)
    }
}
