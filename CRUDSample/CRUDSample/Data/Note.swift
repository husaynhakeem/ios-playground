//
//  Note.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import Foundation

class Note: Identifiable {
    let id: UUID
    var content: String
    var lastUpdated: Date
    
    init(content: String) {
        self.id = UUID()
        self.content = content
        self.lastUpdated = Date()
    }
    
    func update(content: String) {
        self.content = content
        self.lastUpdated = Date()
    }
}

extension Note: ObservableObject {
    static func == (lhs: Note, rhs: Note) -> Bool {
        lhs.id == rhs.id
    }
}
