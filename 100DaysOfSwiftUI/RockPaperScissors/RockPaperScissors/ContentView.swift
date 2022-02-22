//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Husayn Hakeem on 2/20/22.
//

import SwiftUI

struct ContentView: View {
    @State private var game = Game.newInstance()
    @State private var showAlert = false
    @State private var alert = Alert()
    @State private var score = 0
    
    var body: some View {
        VStack {
            space(coeff: 2)
            
            ScoreView(score: score)
            
            space()
            
            RockPaperScissors(
                labelPlacement: .top,
                selectedTile: game.gameTile,
                isEnabled: false)
            
            space()
            
            VStack(spacing: 8) {
                HStack(spacing: 0) {
                    Text("The game played ")
                    Text(game.gameTile.rawValue)
                        .underline()
                }
                
                HStack(spacing: 0) {
                    Text("Play rock, paper or scissors to ")
                    Text(game.shouldPlayerWin ? "win" : "lose")
                        .underline()
                }
            }
            
            space()
            
            RockPaperScissors(
                labelPlacement: .bottom,
                onSelected: onPlayerPlayed)
            
            space(coeff: 2)
        }
        .alert(alert.title, isPresented: $showAlert) {
            Button(alert.actionLabel) {
                game = Game.newInstance()
            }
        } message: {
            Text(alert.message)
        }
    }
    
    private func space(coeff: Int = 1) -> some View {
        ForEach(0..<coeff, id: \.self) { _ in
            Spacer()
        }
    }
    
    private func onPlayerPlayed(playerTile: TileType) {
        game.playerTile = playerTile
        
        let didPlayerWin = game.didPlayerWin
        score = didPlayerWin ? score + 10 : score - 10
        
        let startOver = Game.gamesCount == Game.MAX_ROUNDS
        alert = Alert(
            title: didPlayerWin ? "You win!" : "You lose!",
            message: startOver ? "Your final score is \(score)" : "Off to the next round",
            actionLabel: startOver ? "Start new game" : "Continue")
        showAlert = true
        
        if startOver {
            Game.gamesCount = 0
            score = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
