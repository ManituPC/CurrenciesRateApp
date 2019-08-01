//
//  BanksListViewController.swift
//  test1122
//
//  Created by denis.chicherin on 7/27/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class BanksListViewController: UIViewController {
    
    let banksListTableViewCellId = "BanksListTableViewCell"

    @IBOutlet weak var banksListTableView: UITableView!
    
    var itemBanksArray: [Bank] = {
        var bank = Bank()
        bank.bankName = "PUMB"
        bank.bankAddress = "VotTutVot, 21b"
        bank.bankBuy = 23.1
        bank.bankSell = 29.9
        return [bank]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        banksListTableView.dataSource = self
        banksListTableView.delegate = self
        let nibCell = UINib(nibName: banksListTableViewCellId, bundle: nil)
        banksListTableView.register(nibCell, forCellReuseIdentifier: banksListTableViewCellId)
    }
}

extension BanksListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemBanksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: banksListTableViewCellId, for: indexPath) as! BanksListTableViewCell
        itemCell.bank = itemBanksArray[indexPath.row]
        return itemCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
