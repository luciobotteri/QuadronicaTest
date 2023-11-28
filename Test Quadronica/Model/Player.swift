//
//  Player.swift
//  Test Quadronica
//
//  Created by Lucio Botteri on 28/11/23.
//

import Foundation

class Player {
    let name: String
    let team: String
    var isFavorite = false
    
    init(name: String, team: String) {
        self.name = name
        self.team = team
    }
}
