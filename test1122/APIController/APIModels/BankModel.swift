//
//  BankModel.swift
//  test1122
//
//  Created by denis.chicherin on 9/3/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import Foundation

import Foundation


struct BankModel: Decodable {
    
    var id: String?
    var bankName: String? //title
    var cityId: String?
    var address: String?
    var currencies: [String: CurrencyModel]
    
    enum CodingKeys: String, CodingKey {
        case id
        case oldId
        case orgType
        case branch
        case bankName = "title"
        case regionId
        case cityId
        case phone
        case address
        case link
        case currencies
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try? container.decode(String.self, forKey: .id)
        self.bankName = try? container.decode(String.self, forKey: .bankName)
        self.address = try? container.decode(String.self, forKey: .address)
        self.cityId = try? container.decode(String.self, forKey: .cityId)
        self.currencies = try! container.decode([String: CurrencyModel].self, forKey: .currencies)
    }
}
