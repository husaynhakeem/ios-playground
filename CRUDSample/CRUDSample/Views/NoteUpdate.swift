//
//  NoteUpdate.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import SwiftUI

struct NoteUpdate: View {
    @State var note: Note
    @EnvironmentObject var notesRepository: NotesRepository
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        return NavigationView {
            TextEditor(text: $note.content)
                .padding()
                .navigationTitle("Update Note")
                .toolbar {
                    ToolbarItem(placement: .status) {
                        Button(action: {
                            notesRepository.updateNote(noteId: note.id, content: note.content)
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Update Note")
                        })
                    }
                }
        }
    }
}

struct NoteUpdate_Previews: PreviewProvider {
    static var previews: some View {
        NoteUpdate(note: Note(content: "A random note"))
    }
}
