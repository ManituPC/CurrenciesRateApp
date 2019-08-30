//
//  BanksListViewController.swift
//  test1122
//
//  Created by denis.chicherin on 7/27/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

var rowIndex = 0

class BanksListViewController: BaseViewController {
    
    let banksListTableViewCellId = "BanksListTableViewCell"
//    var bankController: BankController!
    
    @IBOutlet weak var banksListTableView: UITableView!
    
    let itemBanksArray: [Bank] = {
        var bank = Bank()
        bank.bankCity = "ZPcity"
        bank.bankName = "PUMB"
        bank.bankAddress = "VotTutVot, 21b"
        bank.bankBuy = 23.1
        bank.bankSell = 29.9
        bank.bankCurrency = [("USD", 23.2),("EUR", 30.0)]
        return [bank]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let bank1 = bankController.bank
        
        banksListTableView.dataSource = self
        banksListTableView.delegate = self
        
        // NavBar settings
        //TODO: add name from selected cell
        self.navigationItem.title = itemBanksArray[0].bankCity
        self.navigationItem.leftBarButtonItem?.title = "Cities"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort by", style: .plain, target: self, action: #selector(addTapped))
        
        // create cell in tableView
        let nibCell = UINib(nibName: banksListTableViewCellId, bundle: nil)
        banksListTableView.register(nibCell, forCellReuseIdentifier: banksListTableViewCellId)
    }
    
    //for test
    @objc func addTapped() {
        print("!!!!!!!!!!!!! best buy / best sell !!!!!!!!!!!!!")
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destinationVC: BankDetailsViewController = segue.destination as? BankDetailsViewController {
//            destinationVC.bankController = bankController
//        }
//    }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowIndex = indexPath.row
        let name = "BankDetailsViewController"
        let viewController = storyboard?.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Average currency = 999.0"
        return label
    }
}
