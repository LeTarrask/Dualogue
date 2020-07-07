//
//  NewContactView.swift
//  Dualogue
//
//  Created by Alex Luna on 01/07/2020.
//

import SwiftUI
import CoreData

struct NewContactView: View {
    @State var contactName: String = ""
    @State var contactImage: String = ""
    
    @State var showContactPicker: Bool = false

    var body: some View {
        Form {
            TextField("Contact Name", text: $contactName)
            
            Text("Choose a contact")
            Button(action: {
                self.showContactPicker.toggle()
            }, label: {
                AvatarView(contactName: contactName, contactImage: contactImage, size: 60)
            })

            Button(action: {
                // TO DO: store this property contact to DB
            }, label: {
                Text("Save contact")
            })
        }.sheet(isPresented: $showContactPicker, onDismiss: { }) {
            ContactPicker(showPicker: $showContactPicker, onSelectContact: { selected in
                self.contactName = selected.namePrefix + " " + selected.nameSuffix
            })
        }
    }
}

