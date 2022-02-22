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
    var labelPlacement: LabelPlacement
    var isEnabled: Bool = true
    var onSelected: (TileType) -> Void = { _ in }
    @Binding var selectedTile: TileType?
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(tiles, id: \.self) { tile in
                TileView(
                    tileData: tile,
                    isSelected: tile.type == selectedTile,
                    onSelected: select)
                    .disabled(!isEnabled)
                
                Spacer()
            }
        }
    }
    
    func select(tile: TileData) {
        selectedTile = tile.type
        onSelected(tile.type)
    }
}

struct RockPaperScissors_Previews: PreviewProvider {
    static var previews: some View {
        let placements = LabelPlacement.allCases
        let selections = Array(arrayLiteral: nil) + TileType.allCases
        let enabled = [true, false]
        ForEach(placements, id: \.self) { placement in
            ForEach(selections, id: \.self) { selection in
                ForEach(enabled, id: \.self) { isEnabled in
                    RockPaperScissors(labelPlacement: placement, isEnabled: isEnabled, selectedTile: .constant(selection))
                }
            }
        }
    }
}
