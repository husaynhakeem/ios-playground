//
//  GameTest.swift
//  GameTest
//
//  Created by Husayn Hakeem on 2/20/22.
//

import XCTest
@testable import RockPaperScissors

class GameTest: XCTestCase {

    func testRockBeatsScissors_PlayerShouldWin() {
        var game = Game(gameTile: TileType.scissors, shouldPlayerWin: true)
        game.playerTile = TileType.rock
        
        XCTAssertTrue(game.didPlayerWin)
    }
    
    func testRockBeatsScissors_PlayerShouldNotWin() {
        var game = Game(gameTile: TileType.scissors, shouldPlayerWin: false)
        game.playerTile = TileType.rock
        
        XCTAssertFalse(game.didPlayerWin)
    }
    
    func testPaperBeatsRock_PlayerShouldWin() {
        var game = Game(gameTile: TileType.rock, shouldPlayerWin: true)
        game.playerTile = TileType.paper
        
        XCTAssertTrue(game.didPlayerWin)
    }
    
    func testPaperBeatsRock_PlayerShouldNotWin() {
        var game = Game(gameTile: TileType.rock, shouldPlayerWin: false)
        game.playerTile = TileType.paper
        
        XCTAssertFalse(game.didPlayerWin)
    }
    
    func testScissorsBeatPaper_PlayerShouldWin() {
        var game = Game(gameTile: TileType.paper, shouldPlayerWin: true)
        game.playerTile = TileType.scissors
        
        XCTAssertTrue(game.didPlayerWin)
    }
    
    func testScissorsBeatPaper_PlayerShouldNotWin() {
        var game = Game(gameTile: TileType.paper, shouldPlayerWin: false)
        game.playerTile = TileType.scissors
        
        XCTAssertFalse(game.didPlayerWin)
    }
}
