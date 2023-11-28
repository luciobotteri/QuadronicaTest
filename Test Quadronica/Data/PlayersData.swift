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
    
    var players = [Player]()
    
    var favorites: [Player] {
        players.filter(\.isFavorite)
    }
    
    func addImageData(_ data: Data, id: Int) {
        if let i = players.firstIndex(where: { $0.playerId == id }) {
            players[i].imageData = data
        }
    }
}
