//
//  Note.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import Foundation

struct Note: Hashable, Identifiable {
    let id: UUID
    let content: String
    
    init(content: String) {
        self.id = UUID()
        self.content = content
    }
}
