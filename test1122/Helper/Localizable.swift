//
//  Localizable.swift
//  test1122
//
//  Created by denis.chicherin on 9/20/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import Foundation


enum Localizable {
    
    enum CityList: String, LocalizableDelegate {
        case titleCitiesList
        case changeCurrency
        case bestBuy
        case bestSell
    }
    
    enum BankList: String, LocalizableDelegate {
        case sortBy
        case averageCost
    }
    
    enum Common: String, LocalizableDelegate {
        case usd
        case eur
    }
}


protocol LocalizableDelegate {
    var rawValue: String { get }
    var table: String? { get }
    var localized: String { get }
}
extension LocalizableDelegate {
    
    //returns a localized value by specified key located in the specified table
    var localized: String {
        return Bundle.main.localizedString(forKey: rawValue, value: nil, table: table)
    }
    
    var table: String? {
        return nil
    }
}
