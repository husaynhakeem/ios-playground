//
//  TileData.swift
//  RockPaperScissors
//
//  Created by Husayn Hakeem on 2/20/22.
//

import Foundation

struct TileData: Equatable, Hashable {
    let type: TileType
    let label: String
    let data: String
    let labelPlacement: LabelPlacement
    
    static func == (lhs: TileData, rhs: TileData) -> Bool {
        lhs.type == rhs.type
    }
}
