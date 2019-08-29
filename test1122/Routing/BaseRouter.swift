//
//  BaseRout.swift
//  test1122
//
//  Created by denis.chicherin on 8/29/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import Foundation
import UIKit


protocol StoryboardRouter {
    var name: String { get }
    var controller: UIViewController { get }
}

extension StoryboardRouter {
    func getController<T>(T: UIViewController.Type) -> T {
        return UIStoryboard(name: name, bundle: nil)
            .instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
}

enum Storyboard: StoryboardRouter {
    
    case SelectCurrency
    case CityList
//    case BanksList
//    case BankDetails
    
    var name: String {
        switch self {
        case .SelectCurrency: return "SelectCurrencyNav"
        case .CityList: return "Main"
        }
    }
    
    var controller: UIViewController {
        switch self {
        case .SelectCurrency: return getController(T: SelectCurrencyViewController.self)
        case .CityList: return getController(T: CitysListViewController.self)
        }
    }
}


