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
            List(notesRepository.notes, id: \.self) { note in
                NoteRow(note: note)
            }
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
