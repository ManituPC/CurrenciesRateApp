//
//  BankDetailsViewController.swift
//  test1122
//
//  Created by denis.chicherin on 8/3/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class BankDetailsViewController: BaseViewController {
    
    @IBOutlet weak var bankDetailsTVC: UITableView!
    
    let bankDetailsTableViewCellId = "BankDetailsTableViewCell"
    var cityController = CityController()
    var cityIndex = 0
    var bankIndex = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        bankDetailsTVC.dataSource = self
        bankDetailsTVC.delegate = self
        let nibCell = UINib(nibName: bankDetailsTableViewCellId, bundle: nil)
        bankDetailsTVC.register(nibCell, forCellReuseIdentifier: bankDetailsTableViewCellId)
        
        // navbar settings
        self.navigationItem.title = cityController.titleBank
        self.navigationItem.leftBarButtonItem?.title = cityController.titleCity
    }
}

extension BankDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityController.cityArray[cityIndex].banksArr?[bankIndex].currencies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: bankDetailsTableViewCellId, for: indexPath) as! BankDetailsTableViewCell
        if let details = cityController.cityArray[cityIndex].banksArr?[bankIndex].currencies {
            let key = details.keys.map{$0}[indexPath.row]
            itemCell.bankDetails = (key, details[key])
        }
        return itemCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
}
