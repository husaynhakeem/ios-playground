//
//  ScoreView.swift
//  RockPaperScissors
//
//  Created by Husayn Hakeem on 2/21/22.
//

import SwiftUI

struct ScoreView: View {
    private let score: Int
    private let font = Font.title
    
    init(score: Int) {
        self.score = score
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Text("Your score: ")
                .font(font)
            Text(String(score))
                .font(font)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 10)
    }
}
