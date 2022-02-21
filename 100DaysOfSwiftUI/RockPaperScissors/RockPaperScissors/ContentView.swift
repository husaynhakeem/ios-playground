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
    
    var body: some View {
        VStack {
            space(coeff: 3)
            
            RockPaperScissors(
                labelPlacement: .top,
                selectedTile: game.gameTile,
                isEnabled: false)
            
            space(coeff: 1)
            
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
            
            space(coeff: 1)
            
            RockPaperScissors(
                labelPlacement: .bottom,
                onSelected: onPlayerPlayed)
            
            space(coeff: 3)
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
    
    private func space(coeff: Int) -> some View {
        ForEach(0..<coeff, id: \.self) { _ in
            Spacer()
        }
    }
    
    private func onPlayerPlayed(playerTile: TileType) {
        self.game.playerTile = playerTile
        
        let didPlayerWin = self.game.didPlayerWin
        if didPlayerWin {
            self.alert = Alert(title: "You win!", message: "Off to the next round", actionLabel: "Continue")
        } else {
            self.alert = Alert(title: "You lose!", message: "Off to the next round", actionLabel: "Continue")
        }
        
        self.showAlert = true
    }
}

extension Collection {
    func random() -> Element {
        self.shuffled()[Int.random(in: 0..<self.count)]
    }
}

struct Alert {
    let title: String
    let message: String
    let actionLabel: String
    
    init() {
        self.init(title: "", message: "", actionLabel: "")
    }
    
    init(title: String, message: String, actionLabel: String) {
        self.title = title
        self.message = message
        self.actionLabel = actionLabel
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
