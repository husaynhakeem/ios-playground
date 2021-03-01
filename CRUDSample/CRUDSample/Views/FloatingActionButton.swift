//
//  FloatingActionButton.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import SwiftUI

struct FloatingActionButton: View {
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: imageName)
                .foregroundColor(Color.white)
                .font(.title)
        })
        .frame(width: 56, height: 56)
        .background(Color.blue)
        .clipShape(Circle())
    }
}

struct FloatingActionButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingActionButton(imageName: "plus") {}
            .previewedInAllColorSchemes
    }
}
