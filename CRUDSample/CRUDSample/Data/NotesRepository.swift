//
//  NotesRepository.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import Foundation

final class NotesRepository: ObservableObject {
    
    @Published var notes: [Note] = []
    
    func addNote(note: Note) {
        notes.append(note)
    }
    
    func updateNote(note: Note) {
        if let index = notes.firstIndex(of: note) {
            notes[index] = note
        }
    }
    
    func deleteNote(note: Note) {
        if let index = notes.firstIndex(of: note) {
            notes.remove(at: index)
        }
    }
}
