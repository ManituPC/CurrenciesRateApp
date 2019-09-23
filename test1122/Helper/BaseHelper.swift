//
//  BaseHelper.swift
//  test1122
//
//  Created by denis.chicherin on 9/16/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import Foundation


class BaseHelper {
    
    func getCurrentLocale() -> String {
        let langStr = Locale.current.languageCode ?? "en"
        return langStr
    }
    
    func getMonth(date: String) -> String {
        var monthString = ""
        let dateFormatter = DateFormatter()
        let lang = getCurrentLocale()
        let identifier = "\(lang)_\(lang.uppercased())_POSIX"
        dateFormatter.locale = Locale(identifier: identifier)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let newDate = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = "MMM"
            monthString = dateFormatter.string(from: newDate)
        }
        print("DEBUG: month is: \(monthString)")
        return monthString
    }
}
