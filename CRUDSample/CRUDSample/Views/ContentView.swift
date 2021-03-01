//
//  ContentView.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var notesRepository: NotesRepository
    
    var body: some View {
        NavigationView {
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
            .navigationTitle("My Notes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NotesRepository())
            .previewedInAllColorSchemes
    }
}
