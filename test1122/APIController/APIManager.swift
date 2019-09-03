//
//  APIManager.swift
//  test1122
//
//  Created by denis.chicherin on 9/2/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class APIManager {
    let baseURL = "http://resources.finance.ua/"
    let language = "ru"
    let request = "/currency-cash.json"
    let session = URLSession.shared
    
    func loadData(completion: @escaping (Result<[BankModel], Error>) -> ()) {
        
        guard let url = URL(string: baseURL + language + request) else { return }
        
        session.dataTask(with: url) { (data, response, error) in
            
            //debug print
            print(data)
            print(response)
            print(error)
            
            if let error = error {
                completion(.failure(error))
                return
            }

            // successful
            do {
                let jsonData = try JSONDecoder().decode(ResponseData.self, from: data!)
                let banksArray = jsonData.organizations
                completion(.success(banksArray))
            } catch let jsonError {
                print("ups: ", jsonError)
                completion(.failure(jsonError))
            }
        }.resume()
    
//        let task = session.dataTask(with: url) { (data, response, error) in
//            if error != nil {
//                assertionFailure("error! \(String(describing: error))")
//            }
//
//            let bankData = try JSONDecoder().decode([Bank].self, from: data!)
//
//            print(data)
//            print(response)
//            print(error)
//        }
//
//        task.resume()
    }

}
