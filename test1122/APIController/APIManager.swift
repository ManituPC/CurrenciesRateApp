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
    let request = "/public/currency-cash.json"
    let session = URLSession.shared
    
    func loadJSONData(completion: @escaping (Result<ResponseData, Error>) -> ()) {
        
        guard let url = URL(string: baseURL + language + request) else { return }
        
        session.dataTask(with: url) { (data, response, error) in
            
            //failed
            if let error = error {
                completion(.failure(error))
                return
            }

            // successful
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(ResponseData.self, from: data)
                    completion(.success(jsonData))
                } catch let jsonError {
                    print("ups: ", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
