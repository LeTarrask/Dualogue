//
//  NoteHeader.swift
//  Dualogue
//
//  Created by Alex Luna on 30/06/2020.
//

import SwiftUI
import ContactsUI

struct NoteHeader: View {
    @ObservedObject var selectedContact: WipContact
    
    var date: String
    @Binding var title: String
    @Binding var isEditing: Bool
    
    @Binding var contactName: String
        
    @State var showPicker: Bool = false
    
    var body: some View {
        ZStack {
            ContactPicker(
                showPicker: $showPicker,
                onSelectContact: { contact in
                    self.contactName = contact.givenName + " " + contact.familyName
                    
                    if contact.imageDataAvailable {
                        selectedContact.contactName = contactName
                        selectedContact.contactImage = UIImage(data: contact.imageData!)

                    }})
            
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
                    self.showPicker.toggle()
                }, label: {
                    AvatarView(for: selectedContact, size: 60)
                })
                
            }
            .padding()
        }
    }
}


