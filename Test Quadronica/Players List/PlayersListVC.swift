//
//  PlayersListVC.swift
//  Test Quadronica
//
//  Created by Lucio Botteri on 28/11/23.
//

import UIKit

class PlayersListVC: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var noResultsLabel: UILabel!
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var players: [Player] { PlayersData.shared.players }
    private var filteredData = [Player]()
    
    private var data: [Player] {
        searchController.isActive ? filteredData : players
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Ricerca calciatore"
        navigationItem.searchController = searchController
        
        noResultsLabel.isHidden = true
    }
}

extension PlayersListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerTableViewCell
        cell.configure(with: data[indexPath.row])
        return cell
    }
}

extension PlayersListVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredData = players.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        } else {
            filteredData = players
        }
        noResultsLabel.isHidden = !filteredData.isEmpty
        tableView.reloadData()
    }
}
