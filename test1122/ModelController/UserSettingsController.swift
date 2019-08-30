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
    
    func setDefaultCurrency(currency: String) {
        let defaults = UserDefaults.standard
        defaults.set(currency, forKey: "defaultCurrency")
        userSettings.selectedCurrency = currency
    }
}
