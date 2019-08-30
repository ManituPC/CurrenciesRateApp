//
//  UserSettingsController.swift
//  test1122
//
//  Created by denis.chicherin on 8/7/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import Foundation


class UserSettingsController {
    
    var userSettings = UserSettings()
    
    func saveDefaultCurrency(currency: String) {
        UserDefaults.standard.set(currency, forKey: "defaultCurrency")
        UserDefaults.standard.synchronize()
        userSettings.selectedCurrency = currency
    }
    
    public func loadDefaultCurrency() {
        if let defaultsCurrency = UserDefaults.standard.string(forKey: "defaultCurrency") {
            userSettings.selectedCurrency = defaultsCurrency
        }
    }
}
