//
//  NoteTimeline.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI
import CoreData

struct NoteTimeline: View {
    @FetchRequest(entity: NoteStorage.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \NoteStorage.title_, ascending: true),])
    var notes: FetchedResults<NoteStorage>
    
    var body: some View {
        List {
            ForEach(notes, id: \.self) { note in
                TimelineItem(isExpanded: false,
                             date: note.date?.toString() ?? "",
                             title: note.title_ ?? "",
                             contactName: note.contacts?.contactName_ ?? "",
                             contactImage: note.contacts?.contactName_ ?? "",
                             text: note.text_)
            }.onDelete(perform: { indexSet in
                //self.notes.remove(atOffsets: indexSet)
            })
            .padding(0)
            .listRowBackground(Color.mainBG)
        }
    }
}



