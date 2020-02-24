//
//  NoteTimeline.swift
//  Dualogue
//
//  Created by Alex Luna on 18/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

// TO DO: add toggle isExpanded on click (in a small check button, preferably)
// TO DO: add mark as completed on swipe right
// TO DO: figure out why it doesn't show the entire properties of the note
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
                
                // DOESNT WORK WITH A COMPLETE NOTE. MEMORY ISSUES????
//                return NotePreView(title: title, date: date, imagePath: imagePath, text: text, completed: completed, contactName: contactName, contactImg: contactImg, isExpanded: isExpanded)
            }.onDelete(perform: { indexSet in
                for index in indexSet {
                    self.moc.delete(self.notes[index])
                }
            })
        }
    }
    
    init() {
        fetchRequest = FetchRequest<NoteStorage>(entity: NoteStorage.entity(), sortDescriptors: [])
        print(fetchRequest)
    }
}

struct NoteTimeline_Previews: PreviewProvider {
    static var previews: some View {
        NoteTimeline()
    }
}

extension Date {
    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
