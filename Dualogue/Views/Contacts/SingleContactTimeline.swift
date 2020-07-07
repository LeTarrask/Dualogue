//
//  SingleContactView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI
import CoreData

struct SingleContactTimeline: View {
    @Environment(\.managedObjectContext) var context
    
    var selectedContact: String

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                AvatarView(contactName: selectedContact, contactImage: "face", size: 60)
                VStack {
                    Text("20")
                    Text("notes")
                }
            }
            NavigationLink(
                destination: SingleNoteView(contactName: selectedContact),
                label: {
                    Text("Create note")
                })
                

            SearchBar()

            //NoteTimeline() // TO DO: filter this timeline to get just this specific contact's predicate
        }
    }
}
