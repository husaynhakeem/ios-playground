//
//  NotesList.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import SwiftUI

struct NotesList: View {
    @EnvironmentObject var notesRepository: NotesRepository
    
    var body: some View {
        List {
            ForEach(notesRepository.notes) { note in
                NoteRow(note: note)
            }
            .onMove(perform: { indices, newOffset in
                notesRepository.moveNotes(oldOffsets: indices, newOffset: newOffset)
            })
            .onDelete(perform: { indexSet in
                notesRepository.deleteNotes(atOffsets: indexSet)
            })
        }
        .toolbar(content: EditButton.init)
    }
}

struct NotesList_Previews: PreviewProvider {
    static var previews: some View {
        NotesList()
            .environmentObject(NotesRepository())
            .previewedInAllColorSchemes
    }
}
