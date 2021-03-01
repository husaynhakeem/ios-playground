//
//  Note.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import Foundation

struct Note: Hashable, Identifiable {
    let id: UUID
    var content: String
    var lastUpdated: Date
    
    init(content: String) {
        self.id = UUID()
        self.content = content
        self.lastUpdated = Date()
    }
    
    mutating func update(content: String) {
        self.content = content
        self.lastUpdated = Date()
    }
}
