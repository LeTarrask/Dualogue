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


// TO DO: shouldn't request data from storage here. It should get it from the model that should be bound to some state here

struct NoteTimeline: View {
//    @FetchRequest var notes: FetchedResults<NoteStorage>
//
//    init() {
//        let request = NoteStorage.fetchRequest()
//        _notes = FetchRequest(fetchRequest: request)
//    }
    
    var body: some View {
        List {
            ForEach(1..<5) { _ in
                Button(action: {
                    print("note touched")
                }, label: {
                    NotePreView(title: "teste 1", date: "2121312")
                    NotePreView(title: "teste 2", date: "22020202", imagePath: "face", text: "Teste", contactName: "Joao", contactImg: "face", completed: false, isExpanded: true)
                })
            }.onDelete(perform: { indexSet in
                // TO DO: Delete Intention to store here
//                for index in indexSet {
//                    self.moc.delete(self.notes[index])
//                }
            })
        .padding(0)
        .listRowBackground(Color.mainBG)
        }
    }
}

//struct NoteTimeline_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteTimeline()
//    }
//}
