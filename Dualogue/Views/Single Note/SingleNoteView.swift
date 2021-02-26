//
//  SingleNoteView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct SingleNoteView: View {
    @State var isEditing: Bool = false
    @State var title: String = "Your string"
    @State var text: String = ""
    @State var contactName: String = "contact name"
    @State var contactImage: String = "face"
    
    var body: some View {
        VStack {
            Button("isediting toggle") {
                self.isEditing.toggle()
            }
            NoteHeader(date: "date", title: $title, isEditing: $isEditing, contactName: $contactName, contactImage: $contactImage)
            NoteBodyText(text: $text, isEditing: $isEditing)
            Spacer()
        }
    }
}

struct SingleNoteView_Previews: PreviewProvider {
    static var previews: some View {
        SingleNoteView()
    }
}
