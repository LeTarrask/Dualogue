//
//  NoteHeader.swift
//  Dualogue
//
//  Created by Alex Luna on 30/06/2020.
//

import SwiftUI
import ContactsUI

struct NoteHeader: View {
    var date: String
    @Binding var title: String
    @Binding var isEditing: Bool
    
    @Binding var contactName: String
    @Binding var contactImage: String
    
    @State var contact: CNContact?
    
    @State var selectContact: Bool = false
    
    func loadContact() {
        guard let contact = contact else { return }
        // GET CNContact data into contact name & contact image
    }
        
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(date)
                    .font(.caption)
                    .foregroundColor(.accent3)
                if isEditing {
                    TextField("Write your note", text: $title)
                } else {
                    Text(title)
                }
            }
            Spacer()
            Button(action: {
                self.selectContact.toggle()
            }, label: {
                AvatarView(contactName: contactName, contactImage: contactImage, size: 60)
            })
        }.sheet(isPresented: $selectContact, onDismiss: { loadContact() }) {
            ContactPicker(contact: $contact)
        }
        .padding()
    }
}


