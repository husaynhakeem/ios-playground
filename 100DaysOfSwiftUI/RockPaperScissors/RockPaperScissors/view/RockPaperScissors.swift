//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by Husayn Hakeem on 2/20/22.
//

import SwiftUI

struct RockPaperScissors: View {
    private var tiles: [TileData] {
        [
            TileData(type: .rock, label: "Rock", data: "shippingbox.fill", labelPlacement: labelPlacement),
            TileData(type: .paper, label: "Paper", data: "paperplane.fill", labelPlacement: labelPlacement),
            TileData(type: .scissors, label: "Scissors", data: "scissors", labelPlacement: labelPlacement),
        ]
    }
    private let labelPlacement: LabelPlacement
    @State private var selected: TileType?
    
    init(labelPlacement: LabelPlacement, selected: TileType? = nil) {
        self.labelPlacement = labelPlacement
        self._selected = State(initialValue: selected)
    }
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(tiles, id: \.self) { tile in
                TileView(
                    tileData: tile,
                    isSelected: tile.type == selected,
                    onSelected: select)
                
                Spacer()
            }
        }
    }
    
    func select(tile: TileData) {
        selected = tile.type
    }
}

struct RockPaperScissors_Previews: PreviewProvider {
    static var previews: some View {
        let placements = LabelPlacement.allCases
        let selections = Array(arrayLiteral: nil) + TileType.allCases
        ForEach(placements, id: \.self) { placement in
            ForEach(selections, id: \.self) { selection in
                RockPaperScissors(labelPlacement: placement, selected: selection)
                
            }
        }
    }
}
