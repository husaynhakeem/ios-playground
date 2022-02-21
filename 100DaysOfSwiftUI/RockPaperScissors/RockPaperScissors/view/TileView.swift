//
//  TileView.swift
//  RockPaperScissors
//
//  Created by Husayn Hakeem on 2/20/22.
//

import SwiftUI

struct TileView: View {
    private let font = Font.system(size: 36)
    private let tileData: TileData
    private let isSelected: Bool
    private let onSelected: (TileData) -> Void
    
    init(tileData: TileData, isSelected: Bool, onSelected: @escaping (TileData) -> Void) {
        self.tileData = tileData
        self.isSelected = isSelected
        self.onSelected = onSelected
    }
    
    var body: some View {
        Button {
            onSelected(tileData)
        } label: {
            VStack {
                if (tileData.labelPlacement == .top) {
                    label
                    labelSpacing
                }
                
                Image(systemName: tileData.data)
                    .font(font)
                    .foregroundColor(color)
                
                if (tileData.labelPlacement == .bottom) {
                    labelSpacing
                    label
                }
            }
        }
    }
    
    private var color: Color {
        isSelected ? .blue : .primary
    }
    
    private var label: some View {
        Text(tileData.label).foregroundColor(color)
    }
    
    private var labelSpacing: some View {
        Spacer().frame(height: 8)
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        let placements = LabelPlacement.allCases
        let selections = [false, true]
        
        ForEach(placements, id: \.self) { placement in
            ForEach(selections, id: \.self) { selection in
                TileView(
                    tileData: TileData(type: .scissors, label: "Scissors", data: "scissors", labelPlacement: placement),
                    isSelected: selection,
                    onSelected: {_ in }
                )
            }
        }
    }
}
