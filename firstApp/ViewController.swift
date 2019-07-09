//
//  ViewController.swift
//  firstApp
//
//  Created by denis.chicherin on 7/2/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let idCell = "cityCell"
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
    }
}
extension ViewController: UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! CityTableViewCell
		cell.titleLable.text = "text"
		cell.subTitleLable.text = "subTitleLable" // TODO: check this point!!! 99.9% is wrong :)
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100.0
	}
}
