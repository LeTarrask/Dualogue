//
//  SingleContactView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct SingleContactTimeline: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                AvatarView(image: "face", size: 60, name: "Alice")
                VStack {
                    Text("20")
                    Text("notes")
                }
            }
            Button(action: {
                // TO DO: call create note
            }, label: {
                Text("Create note")
            })
            
            NoteTimeline() // TO DO: filter this timeline to get just this specific contact's predicate
        }
    }
}

struct SingleContactView_Previews: PreviewProvider {
    static var previews: some View {
        SingleContactTimeline()
    }
}
