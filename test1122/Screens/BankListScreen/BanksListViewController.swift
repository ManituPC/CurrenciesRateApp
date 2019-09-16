//
//  BanksListViewController.swift
//  test1122
//
//  Created by denis.chicherin on 7/27/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit


class BanksListViewController: BaseViewController {
    
    let banksListTableViewCellId = "BanksListTableViewCell"
    var cityController = CityController()
    var cityIndex = 0
    var status = 0
    
    @IBOutlet weak var banksListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        banksListTableView.dataSource = self
        banksListTableView.delegate = self
        
        // NavBar settings
        self.navigationItem.title = cityController.titleCity
        self.navigationItem.leftBarButtonItem?.title = "Cities"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort by buy/sell", style: .plain, target: self, action: #selector(sortBy))
        
        // create cell in tableView
        let nibCell = UINib(nibName: banksListTableViewCellId, bundle: nil)
        banksListTableView.register(nibCell, forCellReuseIdentifier: banksListTableViewCellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func refresh() {
        DispatchQueue.main.async { [weak self] in
            self?.banksListTableView.reloadData()
        }
    }
    
    //for test
    @objc func sortBy() {
        let tuple = cityController.sortBankByBuySell(banksArr: cityController.cityArray[cityIndex].banksArr ?? [], curr: userSettingsController.userSettings.selectedCurrency ?? "USD")
    
        if status == 0 {
            status += 1
            cityController.cityArray[cityIndex].banksArr = tuple.buy
            refresh()
        } else {
            status -= 1
            cityController.cityArray[cityIndex].banksArr = tuple.sell
            refresh()
        }
    }
}

extension BanksListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityController.cityArray[cityIndex].banksArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: banksListTableViewCellId, for: indexPath) as! BanksListTableViewCell
        itemCell.currency = userSettingsController.userSettings.selectedCurrency
        itemCell.bank = cityController.cityArray[cityIndex].banksArr?[indexPath.row]
        return itemCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Average cost = \(String(format:"%.2f", cityController.cityArray[cityIndex].bestAvarage!))"
        return label
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? BankDetailsViewController {
            destinationVC.cityController = cityController
            destinationVC.cityIndex = cityIndex
            if let index = sender as? Int {
                destinationVC.cityController.titleBank = cityController.cityArray[cityIndex].banksArr?[index].bankName
                destinationVC.bankIndex = index
            }
        }
    }
}
