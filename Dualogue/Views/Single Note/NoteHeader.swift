//
//  NoteHeader.swift
//  Dualogue
//
//  Created by Alex Luna on 30/06/2020.
//

import SwiftUI

struct NoteHeader: View {
    var date: String
    @Binding var title: String
    @Binding var isEditing: Bool
    
    @Binding var contactName: String
    @Binding var contactImage: String
    
    var contact:Contact { Contact(contactName: contactName, contactImage: contactImage) }
        
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
                // TO DO: call contact picker and change name and image
            }, label: {
                AvatarView(contact: contact, size: 60)
            })
        }.padding()
    }
}


