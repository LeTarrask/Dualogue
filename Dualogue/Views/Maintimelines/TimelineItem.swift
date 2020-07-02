//
//  TimelineItem.swift
//  Dualogue
//
//  Created by Alex Luna on 30/06/2020.
//

import SwiftUI

struct TimelineItem: View {
    @State var isExpanded: Bool = false
    var date = "date"
    var title: String
    var contactName: String = ""
    var contactImage: String = "face"
    var text: String?
    
    var body: some View {
        Group {
            NoteTimelineHeader(date: date, title: title, contactName: contactName, contactImage: contactImage)

            if isExpanded {
                NoteBody(text: text)
            }
        }
        .onTapGesture { self.isExpanded.toggle() }
    }
}

struct NoteTimelineHeader: View {
    var date: String
    var title: String
    var contactName: String = ""
    var contactImage: String = "face"

        
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(date)
                    .font(.caption)
                    .foregroundColor(.accent3)
                Text(title)
            }
            Spacer()
            AvatarView(contactName: contactName, contactImage: contactImage, size: 60)
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

struct TimelineItem_Previews: PreviewProvider {
    static var previews: some View {
        TimelineItem(title: "test") }
}
