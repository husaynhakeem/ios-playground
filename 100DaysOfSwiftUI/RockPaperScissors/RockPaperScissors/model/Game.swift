//
//  Game.swift
//  RockPaperScissors
//
//  Created by Husayn Hakeem on 2/20/22.
//

import Foundation

struct Game {
    
    /// Defines the rules of what beats what.
    /// For each key-value pair in this dictionary, the key beats the value.
    /// E.g: Rock beats scissors
    private static let rules: [TileType:TileType] = [
        .rock: .scissors,
        .paper: .rock,
        .scissors: .paper
    ]
    
    static let MAX_ROUNDS = 10
    static var gamesCount = 0
    
    var gameTile: TileType
    let shouldPlayerWin: Bool
    
    var playerTile: TileType? = nil
    var didPlayerWin: Bool {
        guard let playerTile = playerTile else {
            return false
        }
        
        let key = shouldPlayerWin ? playerTile : gameTile
        let value = shouldPlayerWin ? gameTile : playerTile
        return Game.rules[key] == value
    }
    
    init(gameTile: TileType, shouldPlayerWin: Bool) {
        self.gameTile = gameTile
        self.shouldPlayerWin = shouldPlayerWin
        Game.gamesCount += 1
    }
    
    static func newInstance() -> Game {
        return Game(gameTile: TileType.allCases.random(), shouldPlayerWin: Bool.random())
    }
}
