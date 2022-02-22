//
//  Alert.swift
//  RockPaperScissors
//
//  Created by Husayn Hakeem on 2/21/22.
//

import Foundation

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
