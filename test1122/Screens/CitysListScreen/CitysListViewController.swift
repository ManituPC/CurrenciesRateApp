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
        var city1 = City()
        //FIX: displaying image + label. Now is working like: or image, or label
        city1.imageName = "cityZ"
        city1.cityName = "ZPcity"
        city1.monthName = "Aug"
        city1.bestBuyCost = 26.16
        city1.bestSellCost = 29.16
        
        var city2 = City()
        //FIX: displaying image + label. Now is working like: or image, or label
        city2.imageName = "cityZ"
        city2.cityName = "Dnepr"
        city2.monthName = "Sep"
        city2.bestBuyCost = 26.18
        city2.bestSellCost = 29.20
        
        return [city1, city2]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: need more details about this
        citysListCollectionsView.dataSource = self
        citysListCollectionsView.delegate = self
        
        // NavBar settings
        // TODO: move to separate controller ???
        self.navigationItem.title = "Cities"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Change currency", style: .plain, target: self, action: #selector(addTapped))
        
        // create cell in collectionView
        let nibCell = UINib(nibName: citysCollectionViewCellId, bundle: nil)
        citysListCollectionsView.register(nibCell, forCellWithReuseIdentifier: citysCollectionViewCellId)
    }
    
    //for test
    @objc func addTapped() {
        print("!!!!!!!!!!!!! click !!!!!!!!!!!!!")
        
        let name = "NavBar"
        let viewController = storyboard?.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
}

extension CitysListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.size.width / 2 - 4
        let columns = collectionView.bounds.size.width / cellWidth
        let width = (collectionView.bounds.size.width - ((columns - 1) * 4)) / columns
        
        return CGSize(width: width, height: 202)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    //TODO: func didSelecte where use segue for open BanksList.storyboard
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = "BanksListViewController"
        let viewController = storyboard?.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
}
