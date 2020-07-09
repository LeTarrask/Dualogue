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
                  sortDescriptors: [NSSortDescriptor(keyPath: \NoteStorage.title_, ascending: true)])
    var fetchedNotes: FetchedResults<NoteStorage>
       
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
                ForEach(fetchedNotes, id: \.id) { note in
                    TimelineItem(isExpanded: false,
                                 date: note.date?.toString() ?? "",
                                 title: note.title_ ?? "",
                                 text: note.text_,
                                 contact: note.contacts)
                }.onDelete(perform: deleteNote)
                .padding(0)
                .listRowBackground(Color.mainBG)
            }
        }
    }
    
    func deleteNote(at offsets: IndexSet) {
        for offset in offsets {
            // find this note in our fetch request
            let note = fetchedNotes[offset]
            
            // delete it from the context
            context.delete(note) // TO DO: test: should delete all the related images
            
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}



