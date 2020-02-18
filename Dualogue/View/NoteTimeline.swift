//
//  NoteTimeline.swift
//  Dualogue
//
//  Created by Alex Luna on 18/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct NoteTimeline: View {
    @ObservedObject var notes = NoteBuilderTest()
    
    var body: some View {
        ScrollView(.vertical) {
            // TO DO: implement model generator for notes with different types
            NotePreView(title: "asdfasdf asdf asdf asdf asdf", date: "fadfadfad", text: "adsfsdf aewrfsadfasdf asdf asdf asdf asdf asdf asdf asdf asdf asdfasdf asdf asdf asdf asd fasd fasd fasd fasdfasdfasdfasdfasdfasdfasdfasd", contactName: "generic", contactImg: "face")
            NotePreView(title: "asdfasdf asdf asdf asdf asdf", date: "fadfadfad", text: "asdfasdf kasdfk asdpfk asp`dfl asdfo ", contactName: "generic", contactImg: "face2", isExpanded: false)
            NotePreView(title: "asdfasdf asdf asdf asdf asdf", date: "fadfadfad")
            NotePreView(title: "asdfasdf asdf asdf asdf asdf", date: "fadfadfad", contactName: "generic", contactImg: "face")
            NotePreView(title: "asdfasdf asdf asdf asdf asdf", date: "fadfadfad")
            NotePreView(title: "asdfasdf asdf asdf asdf asdf", date: "fadfadfad", contactImg: "face2")
            NotePreView(title: "asdfasdf asdf asdf asdf asdf", date: "fadfadfad")
            NotePreView(title: "asdfasdf asdf asdf asdf asdf", date: "fadfadfad")
            NotePreView(title: "asdfasdf asdf asdf asdf asdf", date: "fadfadfad")
        }
    }
}

struct NoteTimeline_Previews: PreviewProvider {
    static var previews: some View {
        NoteTimeline()
    }
}
