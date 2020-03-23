//
//  NoteStore.swift
//  Dualogue
//
//  Created by Alex Luna on 11/03/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import Foundation
import SwiftUI

class NoteStore: ObservableObject {
    @Environment(\.managedObjectContext) var moc
    
    @Published var notes = [DuaNote]()
        
    var fetchRequest: FetchRequest<NoteStorage>
    var requestedNotes: FetchedResults<NoteStorage> { fetchRequest.wrappedValue }
    
    // MARK: - empties the collection in memory
    func reset() {
        self.notes = [DuaNote]()
        // TO DO: should empty DB as well
    }
    
    // MARK: - stores notes & info to DB
    func sendInfoToDB(note: DuaNote) {
        // TO DO: check if note already exists in DB and in notes variable. This would allow to edit note that already exists
        
//        if let filter = notes.filter({$0.id == note.id}) {
//            // filter = note that already exists, should edit it.
//        }
        let newNote = NoteStorage(context: self.moc)
        newNote.title = note.title
        newNote.text = note.text
        newNote.date = note.date
        
        if let contact = note.contact {
            // TO DO: Check if contact already exists in moc
            let newContact = ContactStorage(context: self.moc)
            newContact.name = contact.name
            newContact.image = contact.image
            
            newNote.contacts = newContact
        }
        
        if let images = note.images {
            for image in images {
                // TO DO: check if image already exists in DB & memory
                // Creates new image in Database
                let newImage = ImageStorage(context: self.moc)
                newImage.id = image.id
                newImage.path = image.filename
                newImage.title = image.title
                newImage.text = image.title
            }
        }
        
        do {
            print("Saving new note")
            try self.moc.save() // permanent storage
            notes.append(note) // memory storage
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - get every note from DB and loads to notes variable
    init () {
        fetchRequest = FetchRequest<NoteStorage>(entity: NoteStorage.entity(), sortDescriptors: [])
    }
}
