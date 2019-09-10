//
//  CurrencyModel.swift
//  test1122
//
//  Created by denis.chicherin on 9/3/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import Foundation

struct CurrencyModel: Decodable {
    var ask: String?
    var bid: String?
    
//    enum CodingKeys: String, CodingKey {
//        case ask
//        case bid
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.ask = try container.decode(String.self, forKey: .ask)
//        self.bid = try container.decode(String.self, forKey: .bid)
//    }
}
