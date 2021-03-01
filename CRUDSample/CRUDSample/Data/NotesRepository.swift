//
//  NotesRepository.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import Foundation

final class NotesRepository: ObservableObject {
    
    @Published var notes: [Note] = [
        .init(content: "Note 1"),
        .init(content: "Note 2"),
        .init(content: "Note 3"),
        .init(content: "Note 4"),
        .init(content: "Note 5"),
        .init(content: "Note 6"),
        .init(content: "Note 7"),
        .init(content: "Note 8"),
        .init(content: "Note 9"),
        .init(content: "Note 10"),
    ]
    
    func addNote(content: String) {
        let newNote = Note(content: content)
        notes.insert(newNote, at: 0)
    }
    
    func updateNote(noteId: UUID, content: String) {
        if let index = notes.firstIndex(where: { $0.id == noteId }) {
            // Remove the note to update from the list of notes
            var noteToUpdate = notes.remove(at: index)
            
            // Update the content of the note
            noteToUpdate.update(content: content)
            
            // Re-insert note at the top of the list of notes
            notes.insert(noteToUpdate, at: 0)
        }
    }
    
    func moveNotes(oldOffsets: IndexSet, newOffset: Int) {
        notes.move(fromOffsets: oldOffsets, toOffset: newOffset)
    }
    
    func deleteNotes(atOffsets indexSet: IndexSet) {
        notes.remove(atOffsets: indexSet)
    }
}
