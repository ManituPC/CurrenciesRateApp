//
//  ViewController.swift
//  test1122
//
//  Created by denis.chicherin on 7/10/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabelView: UITableView!
    
    let idCell = "mailCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.dataSource = self
        tabelView.delegate = self
        tabelView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
    }


}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! BankListTableViewCell
        cell.labelText_1.text = "text_1"
        cell.labelText_2.text = "text_2"
        cell.lableText_3.text = "text_3"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
