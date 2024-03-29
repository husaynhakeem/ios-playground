//
//  NoteRow.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import SwiftUI

struct NoteRow: View {
    @State var note: Note
    
    var body: some View {
        NavigationLink(
            destination: NoteUpdate(note: note)
        ) {
            VStack(alignment: .leading, spacing: 8.0) {
                DateText(date: note.lastUpdated)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(note.content)
                    .font(.title2)
            }
            .padding()
        }
    }
}

private struct DateText: View {
    let date: Date
    
    var body: some View {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy 'at' hh:mm:ss"
        return Text(dateFormatter.string(from: date))
    }
}

struct NoteRow_Previews: PreviewProvider {
    static var previews: some View {
        NoteRow(note: .init(content: "A random note"))
            .previewedInAllColorSchemes
    }
}
