//
//  PlayersListVC.swift
//  Test Quadronica
//
//  Created by Lucio Botteri on 28/11/23.
//

import UIKit

class PlayersListVC: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var noResultsLabel: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var players: [Player] { PlayersData.shared.players }
    private var filteredData = [Player]()
    
    private var data: [Player] {
        searchController.isActive ? filteredData : players
    }
    
    let networkLayer = NetworkLayer()
    
    private func fetchPlayers() {
        activityIndicator.startAnimating()
        networkLayer.fetchPlayers { [weak self] result in
            switch result {
            case .success(let players):
                PlayersData.shared.players = players
                DispatchQueue.main.async {
                    self?.tableView?.reloadData()
                    self?.activityIndicator.stopAnimating()
                }
            case .failure(let error):
                // TODO: Gestire l'errore
                DispatchQueue.main.async {
                    self?.noResultsLabel.isHidden = false
                    self?.noResultsLabel.text = error.localizedDescription
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = Constants.Strings.searchPlaceholder
        navigationItem.searchController = searchController
        
        noResultsLabel.isHidden = true
        
        fetchPlayers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

extension PlayersListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.identifier, for: indexPath) as! PlayerTableViewCell
        cell.configure(with: data[indexPath.row])
        return cell
    }
}

extension PlayersListVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredData = players.filter { $0.playerName.lowercased().contains(searchText.lowercased()) }
        } else {
            filteredData = players
        }
        noResultsLabel.text = Constants.Strings.noResults
        noResultsLabel.isHidden = !filteredData.isEmpty
        tableView.reloadData()
    }
}
