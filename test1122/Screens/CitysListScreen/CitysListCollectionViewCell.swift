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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var city: City? {
        didSet {
            cityImage.image = UIImage(named: "cityZ")
            cityNameLabel.text = city?.cityName
            monthAndCurrencyLabel.text = "\(String(describing: (city?.monthName)!))  \(String(format:"%.2f", (city?.bestAvarage)!))"
            bestBuyLabel.text = "\(NSLocalizedString("best_buy", comment: "")) \n\(String(format:"%.2f", (city?.bestBuyCost)!))"
            bestSellLabel.text = "\(NSLocalizedString("best_sell", comment: "")) \n\(String(format:"%.2f", (city?.bestSellCost)!))"
        }
    }
}
