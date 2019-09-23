//
//  CityListCollectionViewCell.swift
//  test1122
//
//  Created by denis.chicherin on 7/24/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class CitysListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var monthAndCurrencyLabel: UILabel!
    @IBOutlet weak var bestBuyLabel: UILabel!
    @IBOutlet weak var bestSellLabel: UILabel!
    
    let image = UIImage(named: "cityZ")

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var city: City? {
        didSet {
            cityImage.image = image
            cityNameLabel.text = city?.cityName
            if let month = city?.monthName {
                monthAndCurrencyLabel.text = "\(month)  \(String(format:"%.2f", (city?.bestAvarage ?? 0.0)))"
            }
            bestBuyLabel.text = "\(Localizable.CityList.bestBuy.localized) \n\(String(format:"%.2f", (city?.bestBuyCost  ?? 0.0)))"
            bestSellLabel.text = "\(Localizable.CityList.bestSell.localized) \n\(String(format:"%.2f", (city?.bestSellCost  ?? 0.0)))"
        }
    }
}
