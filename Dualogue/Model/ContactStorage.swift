//
//  ContactStorage.swift
//  Dualogue
//
//  Created by Alex Luna on 03/03/2021.
//

import Foundation

extension ContactStorage {
    var name: String {
        contactName ?? ""
    }
    
//    var image: String {
//        contactImage ?? "face"
//    }
    
    static var example: ContactStorage {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext

        let contact = ContactStorage(context: viewContext)
        contact.contactName = "tarrask"
        return contact
    }
}

