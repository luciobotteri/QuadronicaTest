//
//  FavoritesVC.swift
//  Test Quadronica
//
//  Created by Lucio Botteri on 28/11/23.
//

import UIKit

class FavoritesVC: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var noDataLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var accessoryStackView: UIStackView!
    
    private var favorites: [Player] {
        PlayersData.shared.favorites
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        accessoryStackView.isHidden = favorites.isEmpty
        titleLabel.isHidden = favorites.isEmpty
        noDataLabel.isHidden = !favorites.isEmpty
        tableView.reloadData()
    }
}

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.identifier, for: indexPath) as! FavoriteTableViewCell
        cell.configure(with: favorites[indexPath.row])
        return cell
    }
}
