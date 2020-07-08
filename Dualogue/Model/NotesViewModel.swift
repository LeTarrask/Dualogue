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
    // Get the managed object context from the shared persistent container.
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // fetch all notes from CD
    @FetchRequest(entity: NoteStorage.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \NoteStorage.title_, ascending: true)])
    var notes: FetchedResults<NoteStorage>
    
    @Published var wipNote: WipNote = WipNote(title: "", text: "", contacts: [WipContact](), images: [WipImage]()) {
        didSet {
            wipChanged = true
        }
    }
    
    var wipChanged: Bool = false
    
    @Published var selectedContact: ContactStorage?
    
    // MARK: - store notes on core data
    func saveNote() {
        if wipChanged {
            let note = NoteStorage(context: context)
            note.title_ = wipNote.title
            note.text_ = wipNote.text
            
            // USER HAS PICKED A CONTACT
            if let wipContact = wipNote.contacts.first {
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
            for wipImage in wipNote.images {
                let image = ImageStorage(context: context)
                image.data = wipImage.imageData.pngData()
                image.title_ = wipImage.imageTitle
                image.subtitle_ = wipImage.imageText
                note.images?.adding(image) // adding to the NSSet. Not tested yet. Doc here: https://developer.apple.com/documentation/foundation/nsset
            }
            
            // Store Changes in Core Data
            try? self.context.save()
            
            // Reset Temporary Storage
            wipChanged = false
            wipNote = WipNote(title: "", text: "", contacts: [WipContact](), images: [WipImage]())
        }
    }
    
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
    
    
    // delete notes on core data
    // publish for environment all notes
    // filter notes according to user, title or UUID
    
}

