//
//  TestNotes.swift
//  Dualogue
//
//  Created by Alex Luna on 23/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

//MARK: Everything here is temporary
class NoteBuilderTest: ObservableObject {
    var noteCollection = [DuaNote]()

    init() {
        let user1 = DuaContact(name: "John", image: "face")
        let user2 = DuaContact(name: "Peter", image: "face2")
        
        var note1 = DuaNote(title: "Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis.")
        note1.contact = user1
        note1.text = "To use that, we just need to add an @ObservedObject property in ContentView, then show the value in our body, like this:"
        note1.images?.append("face")
        noteCollection.append(note1)

        var note2 = DuaNote(title: "via lactea fez os dinossaurosPaisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.")
        note2.contact = user2
        note2.text = "To use that, we just need to add an @ObservedObject property in ContentView, then show the value in our body, like this:"
        note2.images?.append("face2")
        noteCollection.append(note2)
        
        var note3 = DuaNote(title: "via lactea fez os dinossaurosPaisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.")
        note3.contact = user1
        note3.text = "To use that, we just need to add an @ObservedObject property in ContentView, then show the value in our body, like this:"
        note3.images?.append("face2")
        noteCollection.append(note3)

        var note4 = DuaNote(title: "Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis.")
        note4.contact = user2
        note4.text = "To use that, we just need to add an @ObservedObject property in ContentView, then show the value in our body, like this:"
        note4.images?.append("face2")
        noteCollection.append(note4)

    }
}
