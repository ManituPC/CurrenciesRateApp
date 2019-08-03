//
//  BankDetailsViewController.swift
//  test1122
//
//  Created by denis.chicherin on 8/3/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class BankDetailsViewController: UIViewController {
    
    let bankDetailsTableViewCellId = "BankDetailsTableViewCell"

    var bank: Bank?
    
    @IBOutlet weak var bankDetailsTVC: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bankDetailsTVC.dataSource = self
        bankDetailsTVC.delegate = self
        let nibCell = UINib(nibName: bankDetailsTableViewCellId, bundle: nil)
        bankDetailsTVC.register(nibCell, forCellReuseIdentifier: bankDetailsTableViewCellId)
        
        //print("!!!!!!!!!!!!! \(bank!.bankCurrency?[0].0) and \(bank!.bankCurrency?[0].1)")
    }
}

extension BankDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (bank?.bankCurrency?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: bankDetailsTableViewCellId, for: indexPath) as! BankDetailsTableViewCell
        itemCell.bankDetails = bank
        return itemCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
