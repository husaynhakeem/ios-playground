//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Husayn Hakeem on 2/20/22.
//

import SwiftUI

struct ContentView: View {
    @State private var gameTile = TileType.allCases.random()
    @State private var userTile: TileType? = nil
    @State private var shouldUserWin: Bool = Bool.random()
    
    var body: some View {
        VStack {
            space(coeff: 3)
            
            RockPaperScissors(
                labelPlacement: .top,
                selectedTile: gameTile,
                isEnabled: false)
            
            space(coeff: 1)
            
            VStack(spacing: 8) {
                HStack(spacing: 0) {
                    Text("The game played ")
                    Text(gameTile.rawValue)
                        .underline()
                }
                
                HStack(spacing: 0) {
                    Text("Play rock, paper or scissors to ")
                    Text(shouldUserWin ? "win" : "lose")
                        .underline()
                }
            }
            
            space(coeff: 1)
            
            RockPaperScissors(labelPlacement: .bottom)
            
            space(coeff: 3)
        }
        .onAppear {
            print("Game tile: \(gameTile)")
            print("User tile: \(String(describing: userTile))")
            print("Should user win: \(shouldUserWin)")
        }
    }
    
    private func space(coeff: Int) -> some View {
        ForEach(0..<coeff, id: \.self) { _ in
            Spacer()
        }
    }
}

extension Collection {
    func random() -> Element {
        self.shuffled()[Int.random(in: 0..<self.count)]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
