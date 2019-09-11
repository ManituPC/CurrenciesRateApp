//
//  ResponseData.swift
//  test1122
//
//  Created by denis.chicherin on 9/3/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import Foundation


struct ResponseData: Decodable {
    var sourceId: String?
    var date: String?
    var organizations: [BankModel]?
    
    // orgTypes
    var one: String?
    var two: String?
    
    var currencies: [String: String]
    var regions: [String: String]
    var cities: [String: String]
    
    
    enum CodingKeys: String, CodingKey {
        case sourceId
        case date
        case organizations
        case orgTypes
        case currencies
        case regions
        case cities
    }
    
    enum OrgTypesCodingKeys: String, CodingKey {
        case one = "1"
        case two = "2"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        sourceId = try container.decode(String.self, forKey: .sourceId)
        date = try container.decode(String.self, forKey: .date)
        self.organizations = try container.decode([BankModel].self, forKey: .organizations)
        self.currencies = try container.decode([String: String].self, forKey: .currencies)
        self.regions = try container.decode([String: String].self, forKey: .regions)
        self.cities = try container.decode([String: String].self, forKey: .cities)
        
        // nested orgTypes
        let orgTypesContainer = try container.nestedContainer(keyedBy: OrgTypesCodingKeys.self, forKey: .orgTypes)
        self.one = try orgTypesContainer.decode(String.self, forKey: .one)
        self.two = try orgTypesContainer.decode(String.self, forKey: .two)
    }
}
