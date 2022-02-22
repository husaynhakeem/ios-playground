//
//  Collection.swift
//  RockPaperScissors
//
//  Created by Husayn Hakeem on 2/21/22.
//

import Foundation

extension Collection {
    func random() -> Element {
        self.shuffled()[Int.random(in: 0..<self.count)]
    }
}
