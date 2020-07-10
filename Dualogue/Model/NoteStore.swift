//
//  NoteStore.swift
//  Dualogue
//
//  Created by Alex Luna on 11/03/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import CoreData
import Combine
import SwiftUI

extension NoteStorage: Identifiable, Comparable {
    public static func < (lhs: NoteStorage, rhs: NoteStorage) -> Bool {
        lhs.id < rhs.id
    }

    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<NoteStorage> {
        let request = NSFetchRequest<NoteStorage>(entityName: "NoteStorage")
        request.sortDescriptors = [NSSortDescriptor(key: "title_", ascending: true)]
        request.predicate = predicate
        return request
    }
}

extension ImageStorage: Identifiable, Comparable {
    public static func < (lhs: ImageStorage, rhs: ImageStorage) -> Bool {
        lhs.id < rhs.id
    }

    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<ImageStorage> {
        let request = NSFetchRequest<ImageStorage>(entityName: "ImageStorage")
        request.sortDescriptors = [NSSortDescriptor(key: "UUID", ascending: true)]
        request.predicate = predicate
        return request
    }
}

extension ContactStorage: Identifiable, Comparable {
    public static func < (lhs: ContactStorage, rhs: ContactStorage) -> Bool {
        lhs.id < rhs.id
    }

    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<ContactStorage> {
        let request = NSFetchRequest<ContactStorage>(entityName: "ContactStorage")
        request.sortDescriptors = [NSSortDescriptor(key: "contactName_", ascending: true)]
        request.predicate = predicate
        return request
    }
}
