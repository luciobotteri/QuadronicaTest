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
    }
}
