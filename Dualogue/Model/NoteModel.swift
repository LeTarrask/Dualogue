//
//  NoteModel.swift
//  Dualogue
//
//  Created by Alex Luna on 23/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

//MARK: NoteModel
struct DuaNote: Identifiable, Hashable {
    static func == (lhs: DuaNote, rhs: DuaNote) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // TO DO: Maybe it shouldn't generate UUID automagically because old notes should already have an UUID
    let id = UUID().uuidString
    
    var contact: DuaContact?
    
    var title: String
    
    var text: String?
    
    let date: Date
    
    var images: [String]?
    
    init(title: String) {
        self.title = title
        self.date = Date()
    }
}

//MARK: ContactModel
struct DuaContact: Identifiable {
    var id = UUID().uuidString
    
    let name: String
    
    let image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

//MARK: ImageModel
struct DuaImage: Identifiable {
    var id = UUID().uuidString
    
    let image: String
    
    var text: String?
    
    var title: String?
    
    init(image: String) {
        self.image = image
    }
}
