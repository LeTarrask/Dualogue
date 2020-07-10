//
//  NoteTimeline.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI
import CoreData

struct NoteTimeline: View {
    @State var filterTerm: String = "" // TO DO: - how to pass an initial value here that gets ALL notes?

    var body: some View {
        VStack {
            HStack {
                Text("Dualogues")
                    .font(.caption).bold()
                    .foregroundColor(.main)
                Spacer()
            }.padding()

            SearchBar(filterTerm: $filterTerm)

            FilteredList(predicate: getPredicate()) { (note: NoteStorage) in
                TimelineItem(isExpanded: false,
                             date: note.date?.toString() ?? "",
                             title: note.title_ ?? "",
                             text: note.text_,
                             contact: note.contacts)
            }
        }
    }

    func getPredicate() -> NSPredicate {
        if filterTerm != "" {
            return NSPredicate(format: "title_ CONTAINS[c] %@", filterTerm)
        } else { return NSPredicate(value: true) }
    }
}
