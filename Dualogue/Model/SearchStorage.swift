//
//  SearchStorage.swift
//  Dualogue
//
//  Created by Alex Luna on 09/07/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import Foundation
import CoreData

struct NoteSearch {
    var note: NoteStorage
    var contact: ContactStorage?
}

extension NoteSearch {
    var predicate: NSPredicate {
        var format = "title_ = %@"
        var args: [NSManagedObject] = [note] // args could be [Any] if needed
        if contact != nil {
            format += " and contacts = %@"
            args.append(contact!)
        }
        return NSPredicate(format: format, argumentArray: args)
    }
}
