//
//  TestNotes.swift
//  Dualogue
//
//  Created by Alex Luna on 23/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

//MARK: Everything here is temporary
class NoteBuilderTest {
    var noteCollection = [DuaNote]()

    init() {
        let user1 = DuaUser(name: "John", image: "face")
        let user2 = DuaUser(name: "Peter", image: "face2")
        
        let note1 = DuaNote(user: user1, text: "Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis.")
        noteCollection.append(note1)

        let note2 = DuaNote(user: user2, text: "via lactea fez os dinossaurosPaisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.")
        noteCollection.append(note2)
        
        let note3 = DuaNote(user: user1, text: "via lactea fez os dinossaurosPaisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.")
        noteCollection.append(note3)

        let note4 = DuaNote(user: user2, text: "Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis.")
        noteCollection.append(note4)

    }
}
