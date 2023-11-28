//
//  PlayerTableViewCell.swift
//  Test Quadronica
//
//  Created by Lucio Botteri on 28/11/23.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    static let identifier = "PlayerCell"
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var teamLabel: UILabel!
    @IBOutlet private weak var leadingView: UIView!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var roundedBackgroundView: UIView!
    
    private var player: Player?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundedBackgroundView.layer.cornerRadius = 10
        leadingView.layer.cornerRadius = leadingView.frame.width/2
    }
    
    func configure(with player: Player) {
        self.player = player
        nameLabel.text = player.name
        teamLabel.text = player.team
        refreshFavoriteAppearance()
    }
    
    @IBAction func favoriteAction(_ sender: UIButton) {
        player?.isFavorite.toggle()
        refreshFavoriteAppearance()
    }
    
    func refreshFavoriteAppearance() {
        guard let player else { return }
        let symbolName = player.isFavorite ? "star.fill" : "star"
        favoriteButton.setImage(UIImage(systemName: symbolName), for: .normal)
        favoriteButton.tintColor = player.isFavorite ? .systemBlue : .systemGray
    }
}
