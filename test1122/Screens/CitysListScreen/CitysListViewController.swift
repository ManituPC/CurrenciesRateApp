//
//  CitysListViewController.swift
//  test1122
//
//  Created by denis.chicherin on 7/24/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class CitysListViewController: UIViewController {
    
    let citysCollectionViewCellId: String = "CitysListCollectionViewCell"
    
    @IBOutlet weak var citysListCollectionsView: UICollectionView!
    
    var itemCityArray: [City] = {
        var city = City()
        //city.imageName = "cityZ"
        city.monthName = "Aug"
        city.bestBuyCost = "Best buy \n26.16"
        city.bestSellCost = "Brst sell \n29.16"
        return [city]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        citysListCollectionsView.dataSource = self
        citysListCollectionsView.delegate = self
        
        let nibCell = UINib(nibName: citysCollectionViewCellId, bundle: nil)
        citysListCollectionsView.register(nibCell, forCellWithReuseIdentifier: citysCollectionViewCellId)
    }
}

extension CitysListViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCityArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = citysListCollectionsView.dequeueReusableCell(withReuseIdentifier: citysCollectionViewCellId, for: indexPath) as? CitysListCollectionViewCell {
            itemCell.city = itemCityArray[indexPath.row]
            return itemCell
        }
        return UICollectionViewCell()
    }
}
