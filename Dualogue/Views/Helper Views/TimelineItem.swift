//
//  TimelineItem.swift
//  Dualogue
//
//  Created by Alex Luna on 30/06/2020.
//

import SwiftUI
import CoreData

struct TimelineItem: View {
    @State var isExpanded: Bool = false
    @State var presentFullNote: Bool = false
    var date = "date"
    var title: String
    var text: String?
    var contact: ContactStorage?

    var body: some View {
        ZStack {
            Color.white

            Group {
                VStack {
                    NoteTimelineHeader(date: date, title: title, contact: contact)

                    if isExpanded {
                        NoteBody(text: text)
                    }
                }
            }
        } // TO DO: sheet is not working because double tap. Should be long press maybe
        .sheet(isPresented: $presentFullNote) { self.presentFullNoteView() }
        .onTapGesture { self.isExpanded.toggle() }
        .onTapGesture(count: 2, perform: { self.presentFullNote.toggle() })
    }

    func presentFullNoteView() -> SingleNoteView {
        let contactSelector = ContactSelector()
        if contact != nil {
            contactSelector.contact = WipContact(from: contact!)!
        }

        let view = SingleNoteView(contactSelector: contactSelector)
        return view
    }
}

struct NoteTimelineHeader: View {
    var date: String
    var title: String
    var contact: ContactStorage?

    var body: some View {
        HStack(alignment: .top) {
            if contact != nil {
                AvatarView(for: contact!, size: 60)
            }
            VStack(alignment: .leading) {
                Text(date)
                    .font(.caption)
                    .foregroundColor(.accent3)
                Text(title)
            }
            Spacer()
        }.padding()
    }
}

struct NoteBody: View {
    var text: String?

    var body: some View {
        Text(text ?? "")
            .lineLimit(nil)
    }
}
