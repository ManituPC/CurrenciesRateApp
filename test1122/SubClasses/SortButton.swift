//
//  SortButton.swift
//  test1122
//
//  Created by denis.chicherin on 9/13/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import Foundation
import UIKit


class SortButton: UIButton {
    var status = 2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        addTarget(self, action: #selector(CurrencyButton.buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        activateButton()
    }
    
    func activateButton()  {
    
        let title = status > 0 ? "" : "Follow" // this for experience
        
        setTitle(title, for: .normal)
    }
}
