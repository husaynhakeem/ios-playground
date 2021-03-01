//
//  AddNote.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import SwiftUI

struct NewNote: View {
    @State private var content: String = ""
    @EnvironmentObject var notesRepository: NotesRepository
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            TextEditor(text: $content)
                .padding()
                .navigationTitle("Add New Note")
                .toolbar {
                    ToolbarItem(placement: .status) {
                        Button(action: {
                            notesRepository.addNote(content: content)
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Add Note")
                        })
                        .disabled(content.isEmpty)
                    }
                }
        }
    }
}

struct AddNote_Previews: PreviewProvider {
    static var previews: some View {
        NewNote()
            .environmentObject(NotesRepository())
            .previewedInAllColorSchemes
    }
}
