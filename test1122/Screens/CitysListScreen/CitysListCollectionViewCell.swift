//
//  CityListCollectionViewCell.swift
//  test1122
//
//  Created by denis.chicherin on 7/24/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class CitysListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var monthAndCurrencyLabel: UILabel!
    @IBOutlet weak var bestBuyLabel: UILabel!
    @IBOutlet weak var bestSellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var city: City? {
        didSet {
            if let image = city?.imageName {
                cityImage.image = UIImage(named: image)
            }
            monthAndCurrencyLabel.text = city?.monthName
            //FIX: convert Optoional double to string
            bestBuyLabel.text = "Best buy \n\(city?.bestBuyCost))"
            bestSellLabel.text = "Best sell \n\(city?.bestSellCost))"
            
        }
    }
}
