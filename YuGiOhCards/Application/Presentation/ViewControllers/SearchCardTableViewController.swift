//
//  SearchCardTableViewController.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/01/20.
//

import UIKit

class SearchCardTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
