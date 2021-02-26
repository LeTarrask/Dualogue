//
//  FakeModel.swift
//  Dualogue
//
//  Created by Alex Luna on 30/06/2020.
//

import SwiftUI

class FakeModel: ObservableObject {
    @Published var notes: [Note]
    
    @Published var contacts: [Contact]
    
    init() {
        notes = [Note]()
        
        contacts = [Contact]()
        
        for x in 1...10 {
            let note = Note(title: "Nota numero \(x)", text: "\(x)lorem ipsum et dolor etc etc etc etc\(x)lorem ipsum et dolor etc etc etc etc\(x)lorem ipsum et dolor etc etc etc etc\(x)lorem ipsum et dolor etc etc etc etc\(x)lorem ipsum et dolor etc etc etc etc\(x)lorem ipsum et dolor etc etc etc etc\(x)lorem ipsum et dolor etc etc etc etc\(x)lorem ipsum et dolor etc etc etc etc\(x)lorem ipsum et dolor etc etc etc etc\(x)lorem ipsum et dolor etc etc etc etc\(x)lorem ipsum et dolor etc etc etc etc\(x)lorem ipsum et dolor etc etc etc etc\(x)lorem ipsum et dolor etc etc etc etc\(x)lorem ipsum et dolor etc etc etc etc\(x)lorem ipsum et dolor etc etc etc etc", contactName: "User \(x)", contactImage: "face")
            notes.append(note)
            if note.contact != nil {
                contacts.append(note.contact!)
            }
        }
    }
}

struct Note: Identifiable, Hashable {
    var title: String
    var text: String?
    var contact: Contact?
    var id: UUID
    var date = Date()
    
    init(title: String, text: String?, contactName: String?, contactImage: String?) {
        self.id = UUID()
        self.title = title
        self.text = text
        if (contactName != nil) {
            contact = Contact(contactName: contactName ?? "No name", contactImage: contactImage)
        }
    }
}

struct Contact: Identifiable, Hashable {
    var contactName: String
    var contactImage: String
    var id: UUID
    
    init(contactName: String, contactImage: String?) {
        self.id = UUID()
        self.contactName = contactName
        self.contactImage = contactImage ?? "face"
    }
}
