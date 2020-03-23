//
//  NoteTimeline.swift
//  Dualogue
//
//  Created by Alex Luna on 18/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

// TO DO: add mark as completed on UI button
// TO DO: add go to SingleNoteView and view note on long press

struct NoteTimeline: View {
    @Environment(\.managedObjectContext) var moc
    
    var fetchRequest: FetchRequest<NoteStorage>
    var notes: FetchedResults<NoteStorage> { fetchRequest.wrappedValue }
    var noteViews = [NotePreView]()
    
    var body: some View {
        List {
            ForEach(notes, id: \.self) { note in
                Button(action: {
                    print(note)
                }, label: {
                    NotePreView(note: note)
                })
            }.onDelete(perform: { indexSet in
                for index in indexSet {
                    self.moc.delete(self.notes[index])
                }
            })
        .padding(0)
        .listRowBackground(Color.mainBG)
        }
    }
    
    init() {
        fetchRequest = FetchRequest<NoteStorage>(entity: NoteStorage.entity(), sortDescriptors: [])
    }
}

struct NoteTimeline_Previews: PreviewProvider {
    static var previews: some View {
        NoteTimeline()
    }
}
