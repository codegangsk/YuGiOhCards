//
//  SearchCardTableViewController.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/01/20.
//

import UIKit
import SnapKit

class SearchCardTableViewController: UITableViewController {
    let searchController = UISearchController(searchResultsController: nil)
    
    let cardRequestedController = CardRequestedController()
    var cards = [Card]()
}

extension SearchCardTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        defineSearchController()
        
        self.tableView.register(SearchCardTableViewCell.self, forCellReuseIdentifier: "SearchCardCellIdentifier")
    }
}

extension SearchCardTableViewController {
    func defineSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Cards"
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }
}

extension SearchCardTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCardCellIdentifier", for: indexPath)
            configure(cell: cell, forItemAt: indexPath)
            return cell
    }
}

extension SearchCardTableViewController {
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchCardTableViewController {
        func fetchMatchingItems() {
            self.cards = []
            self.tableView.reloadData()
            
            let searchTerm = searchController.searchBar.text ?? ""
            
            if !searchTerm.isEmpty {
                let query: [String: String] = [
                    "fname": "\(searchTerm)",
                    "limit": "200"
                ]
                cardRequestedController.fetchItems(matching: query) {card in
                    if let card = card {
                        DispatchQueue.main.async {
                            self.cards = card
                            self.tableView.reloadData()
                        }
                    } else {
                        print("error")
                    }
                }
            }
        }
        
        func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
            let card = cards[indexPath.row]
            cell.textLabel?.text = card.name
            cell.detailTextLabel?.text = card.type
    }
}

extension SearchCardTableViewController: UISearchControllerDelegate {
        func searchBarSearchButtonClicked(_ searchController: UISearchController) {
            searchController.resignFirstResponder()
        }
    }

extension SearchCardTableViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    // TODO
  }
}

