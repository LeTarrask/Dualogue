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
    var date = "date"
    var title: String
    var text: String?
    var contact: ContactStorage?

    var body: some View {
        ZStack {
            // TO DO: Add navigation link to view full note
            Color.white

            Group {
                NoteTimelineHeader(date: date, title: title, contact: contact)

                if isExpanded {
                    NoteBody(text: text)
                }
            }
        }
        .onTapGesture { self.isExpanded.toggle() }
    }
}

struct NoteTimelineHeader: View {
    var date: String
    var title: String
    var contact: ContactStorage?

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(date)
                    .font(.caption)
                    .foregroundColor(.accent3)
                Text(title)
            }
            Spacer()
            if contact != nil {
                AvatarView(for: contact!, size: 60)
            }
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
