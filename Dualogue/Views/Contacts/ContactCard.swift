//
//  ContactCard.swift
//  Dualogue
//
//  Created by Alex Luna on 01/07/2020.
//

import SwiftUI

struct ContactCard: View {
    @EnvironmentObject var model: FakeModel
    
    var contact: Contact
    var image: String
    var name: String
    
    init(contact: Contact) {
        self.contact = contact
        self.image = contact.contactImage
        self.name = contact.contactName
    }
        
    var body: some View {
        VStack {
            Button(action: {
                print("sheet touched")
                // Should go to single contact
            }) {
                AvatarView(contact: contact, size: 120)
                    .foregroundColor(.white)
                    .padding()
            }
            
            
            Button(action: {
                // TO DO: call create note
            }, label: {
                Text("CREATE NOTE")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 20)
                                    .accentColor(.accent3))
            })
        }
        .padding(10)
        .background(Color.accent1)
        .cornerRadius(20)
    }
}

struct ContactCard_Previews: PreviewProvider {
    static var previews: some View {
        let contact = Contact(contactName: "Tarrask", contactImage: "face")
        return ContactCard(contact: contact)
            .environmentObject(FakeModel())
    }
}
