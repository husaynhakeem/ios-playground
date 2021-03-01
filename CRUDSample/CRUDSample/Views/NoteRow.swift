//
//  NoteRow.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import SwiftUI

struct NoteRow: View {
    
    let note: Note
    
    var body: some View {
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

private struct DateText: View {
    let date: Date
    
    var body: some View {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss 'on' yyyy-MM-dd"
        return Text(dateFormatter.string(from: date))
    }
}

struct NoteRow_Previews: PreviewProvider {
    static var previews: some View {
        NoteRow(note: .init(content: "A random note"))
            .previewedInAllColorSchemes
    }
}
