//
//  NoteManager.swift
//  Dualogue
//
//  Created by Alex Luna on 24/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import Foundation
import SwiftUI

class NoteManager: ObservableObject {
    // CoreData setup:
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: NoteStorage.entity(), sortDescriptors: []) var notes: FetchedResults<NoteStorage>
    @FetchRequest(entity: ContactStorage.entity(), sortDescriptors: []) var contacts: FetchedResults<NoteStorage>
    
    @Published var noteCollection: [DuaNote]
    @Published var contactCollection: [DuaContact]
    var isLoading: Bool
    
    init() {
        noteCollection = [DuaNote]()
        contactCollection = [DuaContact]()
        isLoading = true
        
        // async get all input from (notes/memory) and turn them into notes data
        // after finised loading:
        
        isLoading = false
    }
    
//    func storeNewNote(// format DuoNote) {
////        let newNote = NoteStorage(context: self.moc)
////        newNote.title = self.title
////        newNote.text = self.text
////        newNote.id = UUID()
//////        newNote.date = self.date
//////
//////        try? self.moc.save()
//    }
    
    func deleteNote() {
        
    }
}
