//
//  SingleContactView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct SingleContactTimeline: View {
    var selectedContact: ContactStorage

    @State var filterTerm: String = "Search"

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

            SearchBar(filterTerm: $filterTerm)

            FilteredList(searchFor: "contacts.contactName_",
                         filterTerm: selectedContact.contactName_ ?? "") { (note: NoteStorage) in
                TimelineItem(isExpanded: false,
                             date: note.date?.toString() ?? "",
                             title: note.title_ ?? "",
                             text: note.text_,
                             contact: note.contacts)
            }
        }
    }
}
