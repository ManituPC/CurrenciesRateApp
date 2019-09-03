//
//  APIManager.swift
//  test1122
//
//  Created by denis.chicherin on 9/2/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    let session = URLSession.shared
    let url = URL(string: "http://resources.finance.ua/ru/public/currency-cash.json")!
    
    func loadData() {
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            print(data)
            print(response)
            print(error)
        })
        
        task.resume()
    }

}
