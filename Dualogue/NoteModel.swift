//
//  NoteModel.swift
//  Dualogue
//
//  Created by Alex Luna on 23/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

//MARK: NoteModel
struct DuaNote: Identifiable {
    var id = UUID().uuidString
    
    let user: DuaUser
    
    let text: String
    
    init(user: DuaUser, text: String) {
        self.user = user
        self.text = text
    }
}

//MARK: UserModel
struct DuaUser: Identifiable {
    var id = UUID().uuidString
    
    let name: String
    
    let image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
