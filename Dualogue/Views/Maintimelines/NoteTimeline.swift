//
//  NoteTimeline.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct NoteTimeline: View {
    @EnvironmentObject var model: FakeModel
    
    var body: some View {
        List {
            ForEach(model.notes, id: \.self) { note in
                TimelineItem(date: note.date.toString(),
                             title: note.title,
                             contact: Contact(contactName: note.contact?.contactName ?? "", contactImage: note.contact?.contactImage ?? ""),
                             text: note.text)
            }.onDelete(perform: { indexSet in
                self.model.notes.remove(atOffsets: indexSet)
            })
            .padding(0)
            .listRowBackground(Color.mainBG)
        }
    }
}

struct NoteTimeline_Previews: PreviewProvider {
    static var previews: some View {
        NoteTimeline()
            .environmentObject(FakeModel())    }
}


