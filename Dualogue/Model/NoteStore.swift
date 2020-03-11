//
//  NoteStore.swift
//  Dualogue
//
//  Created by Alex Luna on 11/03/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import Foundation
import SwiftUI

class NoteStore {
    @Environment(\.managedObjectContext) var moc
    
    var notes = [DuaNote]()
    
    // MARK: - empties the collection
    func reset() {
        self.notes = [DuaNote]()
    }
    
    // MARK: - stores notes & info to DB
    func sendInfoToDB(note: DuaNote) {
        let newNote = NoteStorage(context: self.moc)
        newNote.title = note.title
        newNote.text = note.text
        newNote.date = note.date
        
        if note.contact?.name != nil {
            // TO DO: Check if contact already exists in moc
            let newContact = ContactStorage(context: self.moc)
            newContact.name = note.contact?.name
            newContact.image = note.contact?.image
            
            newNote.contacts = newContact
        }
        
        do {
            try self.moc.save()
            print("Saving new note")
        } catch {
            print(error.localizedDescription)
        }
    }
}
