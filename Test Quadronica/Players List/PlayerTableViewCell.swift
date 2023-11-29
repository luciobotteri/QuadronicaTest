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
    @IBOutlet private weak var playerImageView: UIImageView!
    
    private var player: Player?
    private var imageTask: Task<Void, Error>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundedBackgroundView.layer.cornerRadius = 10
        leadingView.layer.cornerRadius = leadingView.frame.width/2
        favoriteButton.setTitle("", for: .normal)
    }
    
    override func prepareForReuse() {
        imageTask?.cancel()
        imageTask = nil
    }
    
    func configure(with player: Player) {
        self.player = player
        nameLabel.text = player.playerName
        teamLabel.text = player.teamAbbreviation
        playerImageView.image = nil
        if let imageData = player.imageData, let image = UIImage(data: imageData) {
            playerImageView.image = image
        } else if let url = URL(string: player.imageURL) {
            fetchImage(url: url, id: player.playerId)
        }
        refreshFavoriteAppearance()
    }
    
    func fetchImage(url: URL, id: Int) {
        imageTask = Task {
            if let data = await NetworkLayer().fetchImageData(from: url) {
                PlayersData.shared.addImageData(data, id: id)
                playerImageView.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func favoriteAction(_ sender: UIButton) {
        if let playerId = player?.playerId {
            PlayersData.shared.toggleFavorite(playerId: playerId)
            refreshFavoriteAppearance()
        }
    }
    
    func refreshFavoriteAppearance() {
        guard let player else { return }
        let symbolName = player.isFavorite ? "star.fill" : "star"
        favoriteButton.setImage(UIImage(systemName: symbolName), for: .normal)
        favoriteButton.tintColor = player.isFavorite ? .systemBlue : .systemGray
    }
}
