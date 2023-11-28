//
//  PlayersData.swift
//  Test Quadronica
//
//  Created by Lucio Botteri on 28/11/23.
//

import Foundation

final class PlayersData {
    static let shared = PlayersData()
    
    private init() {}
    
    var players = [
        Player(name: "Osimhen", team: "NAP"),
        Player(name: "Lookman", team: "ATA"),
        Player(name: "Vieri", team: "LAZ")
    ]
    
    var favorites: [Player] {
        players.filter(\.isFavorite)
    }
}
