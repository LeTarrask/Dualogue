//
//  NoteTimeline.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct NoteTimeline: View {
    @EnvironmentObject var model: DataController
    
    let notes: FetchRequest<NoteStorage>
        
    init(filterName: String) {
        
        let predicate = NSPredicate(format: "contacts = %d", filterName)
        
        notes = FetchRequest<NoteStorage>(entity: NoteStorage.entity(),
                                          sortDescriptors: [NSSortDescriptor(keyPath: \NoteStorage.date, ascending: false)],
                                          predicate: predicate)
    }
    
    init() {
        notes = FetchRequest<NoteStorage>(entity: NoteStorage.entity(),
                                          sortDescriptors: [NSSortDescriptor(keyPath: \NoteStorage.date, ascending: false)],
                                          predicate: nil)
    }
    
    var body: some View {
        List {
            ForEach(notes.wrappedValue, id: \.self) { note in
                TimelineItem(isExpanded: false,
                             date: note.stringDate,
                             title: note.stringTitle,
                             contactName: note.contact?.name ?? "",
                             contactImage: "face",
                             text: note.stringText)
            }.onDelete(perform: { indexSet in
//                self.model.notes.remove(atOffsets: indexSet)
            })
            .padding(0)
            .listRowBackground(Color.mainBG)
        }
    }
}

struct NoteTimeline_Previews: PreviewProvider {
    static var dataController = DataController.preview
    
    static var previews: some View {
        Group {
            NoteTimeline()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)

            NoteTimeline(filterName: "Contato 1")
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}

