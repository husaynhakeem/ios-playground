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
    
    init(id: UUID, content: String) {
        self.id = id
        self.content = content
        self.lastUpdated = Date()
    }
    
    convenience init(content: String) {
        self.init(id: UUID(), content: content)
    }
}

extension Note: ObservableObject {
    static func == (lhs: Note, rhs: Note) -> Bool {
        lhs.id == rhs.id
    }
}
