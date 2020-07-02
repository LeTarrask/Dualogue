//
//  SingleContactView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct SingleContactTimeline: View {
    var selectedContact: String
    
    // TO DO: must add a fetchrequest for all the notes from specific contact, and also his image to provide the avatarview and also the notetimeline

    var body: some View {
        VStack {
            HStack {
                Spacer()
                //AvatarView(contactName: <#T##String#>, contactImage: <#T##String#>, size: <#T##CGFloat#>)
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

            //NoteTimeline() // TO DO: filter this timeline to get just this specific contact's predicate
        }
    }
}
