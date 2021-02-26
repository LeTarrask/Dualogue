//
//  NewContactView.swift
//  Dualogue
//
//  Created by Alex Luna on 01/07/2020.
//

import SwiftUI

struct NewContactView: View {
    @EnvironmentObject var model: FakeModel
    
    @State var contactName: String = ""
    @State var contactImage: String = ""
    
    @State var contact: Contact?
    
    var body: some View {
        Form {
            TextField("Contact Name", text: $contactName)
            
            if contact != nil {
                AvatarView(contact: contact!, size: 60)
            } else {
                Button(action: {
                    // TO DO: Call contact picker
                }, label: {
                    AvatarView(contact: Contact(contactName: "Choose a contact", contactImage: "face"), size: 60)
                })
            }
            
            Button(action: {
                self.contact = Contact(contactName: contactName, contactImage: contactImage)
                // TO DO: store this property contact to DB
            }, label: {
                Text("Save contact")
            })
        }
    }
}

struct NewContactView_Previews: PreviewProvider {
    static var previews: some View {
        NewContactView()
            .environmentObject(FakeModel())
    }
}
