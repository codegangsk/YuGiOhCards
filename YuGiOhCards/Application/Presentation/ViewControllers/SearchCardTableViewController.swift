//
//  SearchCardTableViewController.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/01/20.
//

import UIKit
import SnapKit

class SearchCardTableViewController: UITableViewController {
    var searchController: UISearchController!
}

extension SearchCardTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        defineSearchController()
    }
}

extension SearchCardTableViewController {
    func defineSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }
}

extension SearchCardTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
