//
//  Player.swift
//  Test Quadronica
//
//  Created by Lucio Botteri on 28/11/23.
//

import Foundation

final class Player: Codable {
    let playerId: Int
    let playerName: String
    let imageURL: String
    let teamAbbreviation: String
    let gamesPlayed: Int
    let averageGrade: Double
    let averageFantaGrade: Double
    
    var isFavorite = false
    var imageData: Data?
    
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
