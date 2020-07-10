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
                destination: createNewNoteView(),
                label: {
                    Text("Create note")
                })

            SearchBar(filterTerm: $filterTerm)

            FilteredList(predicate: getPredicate() ) { (note: NoteStorage) in
                TimelineItem(isExpanded: false,
                             date: note.date?.toString() ?? "",
                             title: note.title_ ?? "",
                             text: note.text_,
                             contact: note.contacts)
            }
        }
    }

    func createNewNoteView() -> SingleNoteView {
        let contactSelector = ContactSelector()
        if let wipContact = WipContact(from: selectedContact) {
            contactSelector.contact = wipContact
        }
        let view = SingleNoteView(selectedContact: contactSelector)
        return view
    }

    func getPredicate() -> NSPredicate {
        let string = selectedContact.contactName_ ?? ""
        let predicateIsContact = NSPredicate(format: "contacts.contactName_ == %@", string)

        if filterTerm != "Search" {
            let predicateIsEnabled = NSPredicate(format: "%K CONTAINS[c] %@", "title_", filterTerm)
            return NSCompoundPredicate(type: .and, subpredicates: [predicateIsContact, predicateIsEnabled])
        } else { return predicateIsContact }
    }
}
