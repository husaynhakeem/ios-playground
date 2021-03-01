//
//  ViewExtensions.swift
//  CRUDSample
//
//  Created by Husayn Hakeem on 2/28/21.
//

import SwiftUI

extension View {
    var previewedInAllColorSchemes: some View {
        ForEach(
            ColorScheme.allCases,
            id: \.self,
            content: preferredColorScheme)
    }
}
