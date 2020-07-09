//
//  NotesViewModel.swift
//  Dualogue
//
//  Created by Alex Luna on 08/07/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import CoreData
import SwiftUI

class NotesViewModel: ObservableObject {
    @Environment(\.managedObjectContext) var context
       
    @Published var fetchedContacts = [ContactStorage]()
    
    // fetch all notes from CD
    @FetchRequest(entity: NoteStorage.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \NoteStorage.title_, ascending: true)])
    var fetchedNotes: FetchedResults<NoteStorage>
    
    // fecth all contacts from CD
//    @FetchRequest(entity: ContactStorage.entity(),
//                  sortDescriptors: [NSSortDescriptor(keyPath: \ContactStorage.contactName_, ascending: true),])
//    var fetchedContacts: FetchedResults<ContactStorage>
    
    @Published var selectedContact: ContactStorage?
    
    @Published var wipNote: WipNote?
    
    @Published var wipImages = [WipImage]()
    
    // MARK: - store notes on core data
    func saveNote(wipNote: WipNote) {
        let note = NoteStorage(context: self.context)
        note.title_ = wipNote.title
        note.text_ = wipNote.text
        
        // USER HAS PICKED A CONTACT
        if let wipContact = wipNote.contact {
            // Fetch contacts in Storage with that user name
            let fetchedContacts = fetchStorage(entity: "ContactStorage", searchParameter: "contactName_", uniqueIdentity: wipContact.contactName)
            
            // If found, adds to note
            if fetchedContacts.count > 0 {
                let chosenContact = fetchedContacts.first as! ContactStorage
                note.contacts = chosenContact
            } else {
                // Else, creates one and adds to note
                let contact = ContactStorage(context: context)
                contact.contactName_ = wipContact.contactName
                contact.contactImage_ = wipContact.contactImage?.pngData()
                note.contacts = contact
            }
        }
        
        // Note has images attached to it
        // store picked images on core data
        if wipNote.images != nil {
            for wipImage in wipNote.images! {
                let image = ImageStorage(context: context)
                image.data = wipImage.imageData.pngData()
                image.title_ = wipImage.imageTitle
                image.subtitle_ = wipImage.imageText
                note.images?.adding(image) // adding to the NSSet. Not tested yet. Doc here: https://developer.apple.com/documentation/foundation/nsset
            }
        }

        // Store Changes in Core Data
        do {
            try self.context.save()
        } catch {
            print("Couldn't save in Core Data")
        }
    }
    
    // MARK: - Remove info from Core Data
    // delete notes on core data
    func remove(note: NoteStorage) {
        context.delete(note)
    }
    
    
    // MARK: - Fetch & Filter info from Core Data
    func fetchStorage(entity: String, searchParameter: String, uniqueIdentity: String) -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity)
        fetchRequest.predicate = NSPredicate(format: "\(searchParameter) CONTAINS[cd] %@", uniqueIdentity)
        
        var results: [NSManagedObject] = []
        
        do {
            results = try context.fetch(fetchRequest)
        }
        catch {
            print("error executing fetch request: \(error)")
        }
        return results
    }

    // filter notes according to user, title or UUID
    
    // MARK: - Edit info from Storage
}

