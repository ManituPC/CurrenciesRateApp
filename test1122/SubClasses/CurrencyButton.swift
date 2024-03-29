//
//  CustomButton.swift
//  test1122
//
//  Created by denis.chicherin on 7/17/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class CurrencyButton: UIButton {

    var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = Colors.twitterBlue.cgColor //Need check without this options
        layer.cornerRadius = frame.size.height/2
        
        setTitleColor(Colors.twitterBlue, for: .normal)
        checkStatus()
        addTarget(self, action: #selector(CurrencyButton.buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        isOn = bool
        
        let color = bool ? Colors.twitterBlue : .clear
        let titleColor = bool ? .white : Colors.twitterBlue
        
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
    }
    
    func checkStatus() {
        if UserDefaults.standard.string(forKey: "defaultCurrency") != nil && self.currentTitle == UserDefaults.standard.string(forKey: "defaultCurrency")  {
            activateButton(bool: !isOn)
        }
    }
}
