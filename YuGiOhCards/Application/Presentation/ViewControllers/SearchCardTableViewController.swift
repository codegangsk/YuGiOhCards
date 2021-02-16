//
//  SearchCardTableViewController.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/01/20.
//

import UIKit
import Alamofire

private enum Section {
    case cards
}

private enum Row: Equatable {
    case card(Card)
}

class SearchCardTableViewController: UITableViewController {
    private var dataSource = DataSource<Section, Row>()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var cards: [Card] = [] {
        didSet {
            setupDataSource()
            tableView.reloadData()
        }
    }
    
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
        
        configureTitleImage()
        configureSearchController()
        
        self.tableView.register(SearchCardTableViewCell.self, forCellReuseIdentifier: "SearchCardCellIdentifier")
        
        setupDataSource()
        
        fetchCards()
    }
}

extension SearchCardTableViewController {
    func configureTitleImage() {
        let imageView = UIImageView(frame: CGRect(x: 0 , y: 0, width: 100, height: 30))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "yugiohLogo")
        navigationItem.titleView = imageView
    }
}

extension SearchCardTableViewController {
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Cards"
        searchController.searchBar.sizeToFit()
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        setupDataSource(keyword: searchText)
        tableView.reloadData()
    }
}

extension SearchCardTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}

extension SearchCardTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfItems(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = dataSource.item(for: indexPath)
        
        switch row {
        case .card(let card):
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCardCellIdentifier", for: indexPath) as! SearchCardTableViewCell
            cell.textLabel?.text = card.name
            cell.detailTextLabel?.text = card.race
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
}

extension SearchCardTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = dataSource.item(for: indexPath)
        switch row {
        case .card(let card):
            let cardDetailViewController = CardDetailViewController()
            cardDetailViewController.card = card
            show(cardDetailViewController, sender: self)
        }
    }
}

extension SearchCardTableViewController {
    func fetchCards() {
        AF
            .request("https://db.ygoprodeck.com/api/v7/cardinfo.php?")
            .validate()
            .responseDecodable(of: CardsResponse.self) { [weak self] (response) in
                guard let self = self,
                      let cards = response.value?.data
                else { return }
                
                self.cards = cards
            }
    }
}

extension SearchCardTableViewController {
    private func setupDataSource(keyword: String? = nil) {
        dataSource.removeAllSections()
        
        dataSource.appendSection(.cards, with: [])
        let rows: [Row] = cards
            .filter {
                guard let keyword = keyword,
                      keyword.isEmpty == false
                else { return true }
                
                return $0.name?.lowercased().contains(keyword.lowercased()) == true
            }
            .compactMap { .card($0) }
        dataSource.append(rows, in: .cards)
    }
}
