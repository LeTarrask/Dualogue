//
//  SingleNoteView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI
import CoreData

struct SingleNoteView: View {
    @Environment(\.managedObjectContext) var context
    
    @State var isEditing: Bool = true
    @State var title: String = "Your string"
    @State var text: String = ""
    @State var contactName: String = "Contact Name"
    @State var contactImage: String = "face"
    @State var date = Date()
    @State var images: [String] = ["teste1", "teste2", "teste3"]
    
    func resetNote() {
        isEditing = false
        title = "Your string"
        text = ""
        contactName = "Contact Name"
        contactImage = "face"
        date = Date()
        images = [String]()
    }
    
    var body: some View {
        Group {
            NoteHeader(date: date.toString(), title: $title, isEditing: $isEditing, contactName: $contactName, contactImage: $contactImage)
            NoteBodyText(text: $text, isEditing: $isEditing)
            
            if isEditing {
                AddImageView(images: $images)
            } else {
                // Caroussel(numberOfImages: <#T##Int#>, content: <#T##() -> _#>)
            }
            // TO DO: Fix all layouts with this geometry reader, setting the frames to UIScreen.main.bounds, e então ir descendo para as subviews necessárias
        }.navigationBarItems(trailing:
                                HStack {
                                    if !isEditing {
                                        Button("Edit") {}
                                    } else {
                                        Button("Save") { saveNote() }
                                    }
                                    
                                    
                                }
        )
    }
    
    func saveNote() {
        let note = NoteStorage(context: context)
        note.title_ = title
        note.text_ = text
        
        if contactName != "Contact Name" { // USER HAS PICKED A CONTACT
            
            // Fetch contacts in Storage with that user name
            let fetchedContacts = fetchContacts(entity: "ContactStorage", uniqueIdentity: contactName)
            
            // If found, adds to note
            if fetchedContacts.count > 0 {
                let chosenContact = fetchedContacts.first as! ContactStorage
                note.contacts = chosenContact
            } else {
                // Else, creates one and adds to note
                let contact = ContactStorage(context: context)
                contact.contactName_ = contactName
                contact.contactImage_ = contactImage
                note.contacts = contact
            }
        }
        try? self.context.save()
        resetNote()
    }
    
    func fetchContacts(entity: String, uniqueIdentity: String) -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity)
        fetchRequest.predicate = NSPredicate(format: "\("contactName_") CONTAINS[cd] %@", uniqueIdentity)
        
        var results: [NSManagedObject] = []
        
        do {
            results = try context.fetch(fetchRequest)
        }
        catch {
            print("error executing fetch request: \(error)")
        }
        return results
    }
}

struct SingleNoteView_Previews: PreviewProvider {
    static var previews: some View {
        SingleNoteView()
    }
}
