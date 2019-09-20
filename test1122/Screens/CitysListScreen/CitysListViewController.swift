//
//  CitysListViewController.swift
//  test1122
//
//  Created by denis.chicherin on 7/24/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class CitysListViewController: BaseViewController {
    
    let citysCollectionViewCellId: String = "CitysListCollectionViewCell"
    var cityController = CityController()
        
    @IBOutlet weak var citysListCollectionsView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
                
        // TODO: need more details about this
        citysListCollectionsView.dataSource = self
        citysListCollectionsView.delegate = self
        
        // NavBar settings
        // TODO: move to separate controller ???
        self.navigationItem.title = Localizable.CityList.titleCitiesList.localized
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: Localizable.CityList.changeCurrency.localized, style: .plain, target: self, action: #selector(clickChangeCurrency))
        
        // create cell in collectionView
        let nibCell = UINib(nibName: citysCollectionViewCellId, bundle: nil)
        citysListCollectionsView.register(nibCell, forCellWithReuseIdentifier: citysCollectionViewCellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cityController.loadJSONDataAndGetInfo(refresh: refresh)
    }
    
    override func refresh() {
        DispatchQueue.main.async { [weak self] in
            self?.citysListCollectionsView.reloadData()
        }
    }
    
    // Navigate to Currency screen
    @objc func clickChangeCurrency() {
        showScreen(name: "SelectCurrencyNav")
    }
}

extension CitysListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityController.cityArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = citysListCollectionsView.dequeueReusableCell(withReuseIdentifier: citysCollectionViewCellId, for: indexPath) as? CitysListCollectionViewCell {
            itemCell.city = cityController.cityArray[indexPath.row]
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let banksListVC = segue.destination as? BanksListViewController {
            banksListVC.cityController = cityController
            if let index = sender as? Int {
                banksListVC.cityController.titleCity = cityController.cityArray[index].cityName
                banksListVC.cityIndex = index
            }
        }
    }
}
