//
//  NoteTimeline.swift
//  Dualogue
//
//  Created by Alex Luna on 18/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct NoteTimeline: View {
    var fetchRequest: FetchRequest<NoteStorage>
    var notes: FetchedResults<NoteStorage> { fetchRequest.wrappedValue}
    var noteViews = [NotePreView]()
    
    var body: some View {
        ScrollView {
            ForEach(notes, id: \.self) { note in
                VStack {
                    NotePreView(title: note.title ?? "", date: "note.date.toString", imagePath: "", text: note.text ?? "lorem ipsum set peee", completed: note.isCompleted ?? false, contactName: "genesio", contactImg: "face", isExpanded: false)
                    // DOESNT WORK WITH A COMPLETE NOTE. MEMORY ISSUES????
//                    NotePreView(title: note.title ?? "", date: note.date.toString, imagePath: "", text: note.text ?? "lorem ipsum set peee", completed: note.isCompleted ?? false, contactName: "genesio", contactImg: "face", isExpanded: false)
                }
            }
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

extension Date {
    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
