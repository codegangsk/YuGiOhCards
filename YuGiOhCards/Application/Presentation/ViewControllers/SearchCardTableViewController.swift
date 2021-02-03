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
    var filteredCards: [Card] = []
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
}

extension SearchCardTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        navigationItem.searchController = searchController
//        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredCards = cards.filter{ (card: Card) -> Bool in
            return (card.name?.lowercased().contains(searchText.lowercased()))!
        }
        tableView.reloadData()
    }
}

extension SearchCardTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredCards.count
        }
        return cards.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCardCellIdentifier", for: indexPath)
        let card: Card
        if isFiltering {
            card = filteredCards[indexPath.row]
        } else {
            card = cards[indexPath.row]
        }
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
        AF
            .request("https://db.ygoprodeck.com/api/v7/cardinfo.php?")
            .validate()
            .responseDecodable(of: CardsResponse.self) { (response) in
                guard let cards = response.value?.data else { return }
                
                self.cards = cards
                self.tableView.reloadData()
            }
    }
}

extension SearchCardTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}

