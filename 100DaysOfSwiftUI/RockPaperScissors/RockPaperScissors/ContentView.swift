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
                showAlert = false
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
        self.game.playerTile = playerTile
        
        let didPlayerWin = self.game.didPlayerWin
        if didPlayerWin {
            self.alert = Alert(title: "You win!", message: "Off to the next round", actionLabel: "Continue")
            score += 10
        } else {
            self.alert = Alert(title: "You lose!", message: "Off to the next round", actionLabel: "Continue")
            score -= 10
        }
        
        self.showAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
