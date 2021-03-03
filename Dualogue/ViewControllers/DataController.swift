//
//  FakeModel.swift
//  Dualogue
//
//  Created by Alex Luna on 30/06/2020.
//

import CoreData
import SwiftUI

class DataController: ObservableObject {
    let container: NSPersistentContainer
    // TO DO: changed this to persistent container. should change to icloud later to after fixing this huge bug
    
    // TO DO: Couldn't manage to implement iCloud capabilities in main app config.
    // Apparently, to make it work I need to have the paid developer account already on.
    
//    As for the Xcode configuration, we need to request access to iCloud using Apple’s CloudKit framework. This is done by going to your target’s settings in Xcode, selecting the Signing & Capabilities tab, then pressing “+ Capability”. You’ll see a whole bunch appear, but I’d like you to select two – first “iCloud”, so we can send and receive data from Apple’s cloud storage, and second “Background Modes”, so iCloud is able to send and receive synchronization data automatically.
//
//Both of those require a little tweaking. For Background Modes, that’s as simple as checking the box marked “Remote notifications” – it allows iCloud to silently notify our app when new data is ready to be downloaded.
//
//As for iCloud, I’d like you to check the box marked CloudKit, which is Apple’s API for sending and receiving data of our choosing – Core Data objects, in this case.
//
//CloudKit needs to know where in our developer account we want to store data, and this is done using containers. You should click the + sign, then enter your existing bundle ID – mine is com.hackingwithswift.ultimateportfolio, but yours is likely to be different.
//
//When you create a new container, Xcode will automatically put “iCloud” at the start of the container ID – it’s nothing to worry about. The main thing is that the container ID you entered should be the same as your app’s bundle ID, so iCloud knows to read and write data smoothly between the two.
//
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Dualogue")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: Methods for CRUD
    func save() {
        if container.viewContext.hasChanges {
            try? container.viewContext.save()
        }
    }
    
    func delete(_ object: NSManagedObject) {
        container.viewContext.delete(object)
    }
    
    // MARK: Methos for testing purposes
    /// Populatesa viewContext instance with contacts and notes so we can visualize and test the app
    func createSampleData() throws {
        let viewContext = container.viewContext
        
        let tarrask = ContactStorage(context: viewContext)
        tarrask.contactName = "tarrask"
//        tarrask.contactImage = "face"
        
        for counter in 1...5 {
            let contact = ContactStorage(context: viewContext)
            contact.contactName = "Contato \(counter)"
            contact.id = UUID()
            
            
            for noteCounter in 1...10 {
                let note = NoteStorage(context: viewContext)
                note.id = UUID()
                note.isCompleted = Bool.random()
                note.date = Date()
                note.title = "Note \(noteCounter)"
                note.text = String(repeating: "Note \(noteCounter)", count: 10)
                }
            }
        try viewContext.save()
    }
    
    /// Creates a preview instance of DataController, with sample data we can use to test and visualize while coding the app.
    static var preview: DataController = {
        let dataController = DataController(inMemory: true)
        let viewContext = dataController.container.viewContext

        do {
            try dataController.createSampleData()
        } catch {
            fatalError("Fatal error creating preview: \(error.localizedDescription)")
        }

        return dataController
    }()
    
    /// Delete all testing data from the app
    func deleteAll() {
        let fetchRequest1: NSFetchRequest<NSFetchRequestResult> = NoteStorage.fetchRequest()
        let batchDeleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest1)
        _ = try? container.viewContext.execute(batchDeleteRequest1)

        let fetchRequest2: NSFetchRequest<NSFetchRequestResult> = ContactStorage.fetchRequest()
        let batchDeleteRequest2 = NSBatchDeleteRequest(fetchRequest: fetchRequest2)
        _ = try? container.viewContext.execute(batchDeleteRequest2)
        
        let fetchRequest3: NSFetchRequest<NSFetchRequestResult> = ImageStorage.fetchRequest()
        let batchDeleteRequest3 = NSBatchDeleteRequest(fetchRequest: fetchRequest3)
        _ = try? container.viewContext.execute(batchDeleteRequest3)
    }
}
