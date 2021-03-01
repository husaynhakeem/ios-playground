//
//  ContentView.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var notesRepository: NotesRepository
    @State var isAddingNote: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationView {
                if notesRepository.notes.isEmpty {
                    EmptyNotes()
                } else {
                    NotesList()
                        .navigationTitle("My Notes")
                }
            }
            .sheet(isPresented: $isAddingNote) {
                NewNote()
            }
            
            FloatingActionButton(imageName: "plus") {
                isAddingNote = true
            }
            .padding(.horizontal, 32)
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
