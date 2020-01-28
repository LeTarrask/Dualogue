//
//  UserData.swift
//  Dualogue
//
//  Created by Alex Luna on 28/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var noteCollection = [DuaNote]()
    
    // TO DO: store collection permanently
    // TO DO: retrieve stored collection
    
    // this init is just to fill the app with data, for layout testing purposes
    init() {
        noteCollection = NoteBuilderTest().noteCollection
    }
}
