//
//  Player.swift
//  Test Quadronica
//
//  Created by Lucio Botteri on 28/11/23.
//

import Foundation
import RealmSwift

final class Player: Object, Codable {
    @Persisted var playerId: Int
    @Persisted var playerName: String
    @Persisted var imageURL: String
    @Persisted var teamAbbreviation: String
    @Persisted var gamesPlayed: Int
    @Persisted var averageGrade: Double
    @Persisted var averageFantaGrade: Double
    
    @Persisted var isFavorite = false
    @Persisted var imageData: Data?
    
    override class func primaryKey() -> String? {
        "playerId"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        playerId = try container.decode(Int.self, forKey: .playerId)
        playerName = try container.decode(String.self, forKey: .playerName)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        teamAbbreviation = try container.decode(String.self, forKey: .teamAbbreviation)
        gamesPlayed = try container.decode(Int.self, forKey: .gamesPlayed)
        averageGrade = try container.decode(Double.self, forKey: .averageGrade)
        averageFantaGrade = try container.decode(Double.self, forKey: .averageFantaGrade)
    }
    
    override init() {
        super.init()
    }
}

extension Player: Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        if lhs.teamAbbreviation == rhs.teamAbbreviation {
            lhs.playerName < rhs.playerName
        } else {
            lhs.teamAbbreviation < rhs.teamAbbreviation
        }
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.playerId == rhs.playerId
    }
}
