//
//  NotesRepository.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import Foundation

final class NotesRepository: ObservableObject {
    
    @Published var notes: [Note] = []
    
    func addNote(content: String) {
        let newNote = Note(content: content)
        notes.insert(newNote, at: 0)
    }
    
    func updateNote(noteId: UUID, content: String) {
        if let index = notes.firstIndex(where: { $0.id == noteId }) {
            // Remove the note to update from the list of notes
            notes.remove(at: index)
            
            // Re-insert note at the top of the list of notes
            notes.insert(Note(id: noteId, content: content), at: 0)
        }
    }
    
    func moveNotes(oldOffsets: IndexSet, newOffset: Int) {
        notes.move(fromOffsets: oldOffsets, toOffset: newOffset)
    }
    
    func deleteNotes(atOffsets indexSet: IndexSet) {
        notes.remove(atOffsets: indexSet)
    }
}
