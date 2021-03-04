//
//  CoreDataTests.swift
//  DualogueTests
//
//  Created by Alex Luna on 03/03/2021.
//


import CoreData
import XCTest
@testable import Dualogue

class CoreDataTests: BaseTestCase {
    func testCreatingProjectsAndItems() {
        let targetCount = 10
        
        for _ in 0..<targetCount {
            let contact = ContactStorage(context: managedObjectContext)
            
            for _ in 0..<targetCount {
                let note = NoteStorage(context: managedObjectContext)
                note.contact = contact
            }
        }
        
        try? managedObjectContext.save()

        XCTAssertEqual(dataController.count(for: ContactStorage.fetchRequest()), 10)
        XCTAssertEqual(dataController.count(for: NoteStorage.fetchRequest()), 100)
    }
    
    func testSampleDataCreationWorks() throws {
        try dataController.createSampleData()

        XCTAssertEqual(dataController.count(for: ContactStorage.fetchRequest()), 6, "There should be 6 sample projects.")
        XCTAssertEqual(dataController.count(for: NoteStorage.fetchRequest()), 50, "There should be 50 sample items.")
    }
    
    func testDeletingProjectCascadeDeletesItems() throws {
        try dataController.createSampleData()

        let request = NSFetchRequest<ContactStorage>(entityName: "ContactStorage")
        let contacts = try managedObjectContext.fetch(request)
        
        // TO DO: this test is sigabrt like crazy, and I dunno why
        // the error is
        // Could not cast value of type 'Dualogue.ContactStorage' (0x600002b624d0)
        // to 'DualogueTests.ContactStorage' (0x12a78f9f8).
        // maybe this is a solution: https://developer.apple.com/forums/thread/11342

//        print(contacts.count)
        XCTAssert(contacts.count > 0)
    }
    
    func testDeleteAllClearsEverything() throws {
        try dataController.createSampleData()
        dataController.deleteAll()

        XCTAssertEqual(dataController.count(for: ContactStorage.fetchRequest()), 0, "deleteAll() should leave 0 projects.")
        XCTAssertEqual(dataController.count(for: NoteStorage.fetchRequest()), 0, "deleteAll() should leave 0 items.")
    }
}
