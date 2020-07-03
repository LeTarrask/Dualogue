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
    
    @State var showPicker: Bool = false
    
    func loadContact() {
        guard let contact = contact else { return }
        self.contactName = contact.givenName + " " + contact.familyName
        let imageData = contact.imageData
        let thumbImageData = contact.thumbnailImageData
        
    }
        
    var body: some View {
        ZStack {
            ContactPicker(
                            showPicker: $showPicker,
                            onSelectContact: { contact in
                                self.contact = contact
                                self.loadContact()
                            }
                        )
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
                    AvatarView(contactName: contactName, contactImage: contactImage, size: 60)
                })
            
            }
            .padding()
        }
    }
}


