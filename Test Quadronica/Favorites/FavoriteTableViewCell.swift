//
//  FavoriteTableViewCell.swift
//  Test Quadronica
//
//  Created by Lucio Botteri on 28/11/23.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    static let identifier = "FavoriteCell"
    
    @IBOutlet private weak var roundedBackgroundView: UIView!
    @IBOutlet private weak var leadingView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var teamLabel: UILabel!
    @IBOutlet private weak var pgLabel: UILabel!
    @IBOutlet private weak var mvLabel: UILabel!
    @IBOutlet private weak var mfvLabel: UILabel!
    @IBOutlet private weak var playerImageView: UIImageView!
    
    
    private var player: Player?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundedBackgroundView.layer.cornerRadius = 10
        leadingView.layer.cornerRadius = leadingView.frame.width/2
    }
    
    func configure(with player: Player) {
        self.player = player
        nameLabel.text = player.playerName
        teamLabel.text = player.teamAbbreviation
        pgLabel.text = String(format:"%.2f", player.gamesPlayed)
        mvLabel.text = String(format:"%.2f", player.averageGrade)
        mfvLabel.text = String(format:"%.2f", player.averageFantaGrade)
        if let imageData = player.imageData, let image = UIImage(data: imageData) {
            playerImageView.image = image
        }
    }
}
