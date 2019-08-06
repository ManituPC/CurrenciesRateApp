//
//  BankDetailsViewController.swift
//  test1122
//
//  Created by denis.chicherin on 8/3/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class BankDetailsViewController: UIViewController {
    
    @IBOutlet weak var bankDetailsTVC: UITableView!
    
    let bankDetailsTableViewCellId = "BankDetailsTableViewCell"
    var bankController: BankController!
    let itemBanksArray: [Bank] = {
        var bank = Bank()
        bank.bankName = "PUMB"
        bank.bankAddress = "VotTutVot, 21b"
        bank.bankBuy = 23.1
        bank.bankSell = 29.9
        bank.bankCurrency = [("USD", 23.2),("EUR", 30.0)]
        return [bank]
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        bankDetailsTVC.dataSource = self
        bankDetailsTVC.delegate = self
        let nibCell = UINib(nibName: bankDetailsTableViewCellId, bundle: nil)
        bankDetailsTVC.register(nibCell, forCellReuseIdentifier: bankDetailsTableViewCellId)
        
        print("!!!!!!!!!!!!! \(itemBanksArray[0].bankCurrency![0].0) and \(itemBanksArray[0].bankCurrency![0].1)")
    }
}

extension BankDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemBanksArray[0].bankCurrency!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: bankDetailsTableViewCellId, for: indexPath) as! BankDetailsTableViewCell
        itemCell.bankDetails = [(itemBanksArray[0].bankCurrency?[indexPath.row])!]
        return itemCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
}
