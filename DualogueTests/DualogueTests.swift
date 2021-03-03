//
//  DualogueTests.swift
//  DualogueTests
//
//  Created by Alex Luna on 29/06/2020.
//

import CoreData
import XCTest
@testable import Dualogue

class BaseTestCase: XCTestCase {
    var dataController: DataController!
    var managedObjectContext: NSManagedObjectContext!

    override func setUpWithError() throws {
        dataController = DataController(inMemory: true)
        managedObjectContext = dataController.container.viewContext
    }
}
