//
//  NoteStorage.swift
//  Dualogue
//
//  Created by Alex Luna on 03/03/2021.
//

import CoreData

extension NoteStorage {
    var stringTitle: String {
        title ?? ""
    }
    
    var stringDate: String {
        date?.toString() ?? Date().toString()
    }
    
    var stringText: String {
        text ?? ""
    }
    
    static var example: NoteStorage {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext

        let note = NoteStorage(context: viewContext)
        note.title = "Example Item"
        note.text = "This is an example item"
        note.isCompleted = true
        note.date = Date()
        return note
    }
}
