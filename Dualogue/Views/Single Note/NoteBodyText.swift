//
//  NoteBodyText.swift
//  Dualogue
//
//  Created by Alex Luna on 30/06/2020.
//

import SwiftUI

struct NoteBodyText: View {
    @Binding var text: String
    @Binding var isEditing: Bool

    var body: some View {
        Group {
            if isEditing {
                TextEditor(text: $text)
            } else {
                Text(text)
            }
        }
    }
}
