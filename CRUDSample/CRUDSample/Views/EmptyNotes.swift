//
//  EmptyNotes.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import SwiftUI

struct EmptyNotes: View {
    var body: some View {
        VStack(spacing: 8.0) {
            Image(systemName: "square.and.pencil")
                .font(.system(size: 60))
            Text("No notes created")
                .font(.title)
            Text("Start jotting down ideas or tasks.")
                .font(.body)
        }
    }
}

struct EmptyNotes_Previews: PreviewProvider {
    static var previews: some View {
        EmptyNotes()
            .previewedInAllColorSchemes
    }
}
