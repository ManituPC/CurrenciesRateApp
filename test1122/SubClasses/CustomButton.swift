//
//  CustomButton.swift
//  test1122
//
//  Created by denis.chicherin on 7/17/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

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
        addTarget(self, action: #selector(CustomButton.buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        isOn = bool
        
        let color = bool ? Colors.twitterBlue : .clear
        //let title = bool ? "Following" : "Follow" // this for experience
        let titleColor = bool ? .white : Colors.twitterBlue
        
        //setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
    }

}
