//
//  SearchCardTableViewController.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/01/20.
//

import UIKit
import Alamofire

class SearchCardTableViewController: UITableViewController {
    let searchController = UISearchController(searchResultsController: nil)
    
    var cards: [Card] = []
}

extension SearchCardTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        defineSearchController()
        fetchCards()
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
            let card = cards[indexPath.row]
            cell.textLabel?.text = card.name
            cell.detailTextLabel?.text = card.race
            return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
      return indexPath
}
}

extension SearchCardTableViewController {
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchCardTableViewController {
    func fetchCards() {
        AF.request("https://db.ygoprodeck.com/api/v7/cardinfo.php?archetype=Blue-Eyes").validate()
            .responseDecodable(of: Cards.self) { (response) in
          guard let cards = response.value else { return }
          self.cards = cards.all
          self.tableView.reloadData()
    }
}
}

extension SearchCardTableViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    // TODO
  }
}

