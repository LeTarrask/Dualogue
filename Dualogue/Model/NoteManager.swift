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
    @FetchRequest(entity: NoteStorage.entity(), sortDescriptors: [])
    var notes: FetchedResults<NoteStorage>
    @FetchRequest(entity: ContactStorage.entity(), sortDescriptors: [])
    var contacts: FetchedResults<ContactStorage>
    
    @Published var noteCollection: [DuaNote]
    @Published var contactCollection: [DuaContact]
    @Published var isLoading: Bool
    
    init() {
        noteCollection = [DuaNote]()
        contactCollection = [DuaContact]()
        isLoading = true
        
//        // MARK: reloads notes from storage to DuaNote format and appends to noteCollection
//        for storedNote in notes {
//            var retrievedNote = DuaNote(title: storedNote.title ?? "")
//            retrievedNote.id = storedNote.id?.uuidString ?? "000"
//            retrievedNote.text = storedNote.text
//            let retrievedContact = storedNote.contacts
//            retrievedNote.contact = DuaContact(name: retrievedContact?.name ?? "", image: retrievedContact?.image ?? "")
//            retrievedNote.date = storedNote.date ?? Date()
//            // missing implement image recovery retrievedNote.images
//            noteCollection.append(retrievedNote)
//        }
//
//        // MARK: reloads contacts from storage to DuaNote format and appends to contactCollection
//        for storedContact in contacts {
//            var retrievedContact = DuaContact(name: storedContact.name ?? "", image: storedContact.image ?? "")
//            retrievedContact.id = storedContact.id?.uuidString ?? "000"
//
//            contactCollection.append(retrievedContact)
//        }
        
        isLoading = false
    }
    
    func storeNewNote(note: DuaNote) {
        let newNote = NoteStorage(context: self.moc)
        
        newNote.title = note.title
        newNote.text = note.text
        newNote.date = note.date
        if note.contact != nil {
            let newContact = ContactStorage(context: self.moc)
            newNote.contacts = newContact
        }
        
        print(note)
        
        do {
            try? self.moc.save()
            print("Saving new note")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteNote() {
        
    }
}
