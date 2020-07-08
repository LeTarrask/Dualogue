//
//  SingleContactView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct SingleContactTimeline: View {
    var selectedContact: ContactStorage
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                AvatarView(for: selectedContact, size: 60)
                VStack {
                    Text("20")
                    Text("notes")
                }
            }
            NavigationLink(
                destination: SingleNoteView(),
                label: {
                    Text("Create note")
                })


            SearchBar()

            //NoteTimeline() // TO DO: filter this timeline to get just this specific contact's predicate
        }
    }
}
