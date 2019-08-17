//
//  BaseViewController.swift
//  test1122
//
//  Created by denis.chicherin on 8/17/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//TODO: more info about Routing
extension UIViewController {
    
    enum Routing {
        case dismiss
        case preparedNavigation
    }
    
    func routing(with routing: Routing) {
        switch type {
        case .navigation:
            preparedNavigation(with: routing)
        case .transport:
            selectedCityTransport(with: routing)
        default:
            break
        }
    }
    
    func preparedNavigation(with routing: Routing) {
        switch routing {
        case .preparedNavigation:
            guard let view = self as? UINavigationController else { break }
            view.setViewControllers([TransportView()], animated: true)
        default: break
        }
    }
    
    func selectedCityTransport(with routing: Routing) {
        switch routing {
        case .selectedCityTransport(let object):
            navigationController?.pushViewController(RoutesView(object), animated: true)
        default: break
        }
    }
    
    
    enum ViewType {
        case undefined
        case navigation
        case transport
    }
    
    private struct Keys {
        static var key = "\(#file)+\(#line)"
    }
    
    var type: ViewType {
        get {
            return objc_getAssociatedObject(self, &Keys.key) as? ViewType ?? .undefined
        }
        set {
            objc_setAssociatedObject(self, &Keys.key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
