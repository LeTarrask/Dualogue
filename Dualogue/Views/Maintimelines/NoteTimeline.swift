//
//  NoteTimeline.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI
import CoreData

struct NoteTimeline: View {
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(entity: NoteStorage.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \NoteStorage.title_, ascending: true),])
    var notes: FetchedResults<NoteStorage>
    
    var body: some View {
        VStack {
            HStack {
                Text("Dualogues")
                    .font(.caption).bold()
                    .foregroundColor(.main)
                Spacer()
            }.padding()
            
            SearchBar()
            
            List {
                ForEach(notes, id: \.self) { note in
                    TimelineItem(isExpanded: false,
                                 date: note.date?.toString() ?? "",
                                 title: note.title_ ?? "",
                                 contactName: note.contacts?.contactName_ ?? "",
                                 contactImage: note.contacts?.contactImage_ ?? "face",
                                 text: note.text_)
                }.onDelete(perform: deleteNote)
                .padding(0)
                .listRowBackground(Color.mainBG)
            }
        }
    }
    
    func deleteNote(at offsets: IndexSet) {
        for offset in offsets {
            // find this note in our fetch request
            let note = notes[offset]
            
            // delete it from the context
            context.delete(note)
        }
        try? context.save()
    }
}



