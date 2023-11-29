//
//  PlayersData.swift
//  Test Quadronica
//
//  Created by Lucio Botteri on 28/11/23.
//

import Foundation
import RealmSwift

final class PlayersData {
    
    static let shared = PlayersData()
    
    private init() {}
    
    private(set) var players = [Player]()
    
    var favorites: [Player] {
        players.filter(\.isFavorite)
    }
    
    func addImageData(_ data: Data, id: Int) {
        do {
            let realm = try Realm()
            if let player = players.first(where: { $0.playerId == id }) {
                try realm.write {
                    player.imageData = data
                }
            }
        } catch {
            print("Realm sync error: \(error.localizedDescription)")
        }
    }
    
    func realmSync(_ players: [Player]) {
        guard self.players.isEmpty else { return }
        do {
            let realm = try Realm()
            try realm.write {
                PlayersData.shared.players = players
                realm.add(players)
            }
        } catch {
            print("Realm sync error: \(error.localizedDescription)")
        }
    }
    
    func toggleFavorite(playerId: Int) {
        do {
            let realm = try Realm()
            if let player = realm.object(ofType: Player.self, forPrimaryKey: playerId) {
                try realm.write {
                    player.isFavorite.toggle()
                }
            }
        } catch {
            print("Realm sync error: \(error.localizedDescription)")
        }
    }
    
    func initializePlayersFromRealm() {
        do {
            let realm = try Realm()
            let realmPlayers = realm.objects(Player.self)
            players = Array(realmPlayers)
        } catch {
            print("Error initializing Realm: \(error)")
        }
    }
}
