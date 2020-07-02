//
//  SingleNoteView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct SingleNoteView: View {
    @Environment(\.managedObjectContext) var context
    
    @State var isEditing: Bool = false
    @State var title: String = "Your string"
    @State var text: String = ""
    @State var contactName: String = "Contact Name"
    @State var contactImage: String = "face"
    
    var body: some View {
        VStack {
            HStack {
                Button("isediting toggle") {
                    self.isEditing.toggle()
                }
                Spacer()
                Button("Save") {
                    // TO DO NOW: SAVE NOTES
                    print("Lets save this note")
                    let note = NoteStorage(context: context)
                    note.title_ = title
                    note.text_ = text
                    
                    // TO DO: there's no catch if contact is already in DB
                    if contactName != "Contact Name" {
                        let contact = ContactStorage(context: context)
                        contact.contactName_ = contactName
                        contact.contactImage_ = contactImage
                        note.contacts = contact
                    }
                    
                    try? self.context.save()
                }
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
