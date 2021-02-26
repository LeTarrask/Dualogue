//
//  SingleContactView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct SingleContactTimeline: View {
    @EnvironmentObject var model: FakeModel
    
    var selectedContact: Contact

    var body: some View {
        VStack {
            HStack {
                Spacer()
                AvatarView(contact: selectedContact, size: 60)
                VStack {
                    Text("20")
                    Text("notes")
                }
            }
            Button(action: {
                // TO DO: call create note
            }, label: {
                Text("Create note")
            })
            
            SearchBar()
            
            NoteTimeline() // TO DO: filter this timeline to get just this specific contact's predicate
        }
    }
}

struct SingleContactView_Previews: PreviewProvider {
    static var previews: some View {
        let contact = Contact(contactName: "Tarrask 1", contactImage: "face")
        return SingleContactTimeline(selectedContact: contact)
            .environmentObject(FakeModel())    }
}
