//
//  NoteTimeline.swift
//  Dualogue
//
//  Created by Alex Luna on 18/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct NoteTimeline: View {
    @EnvironmentObject var noteManager: NoteManager
    
    var body: some View {
        ScrollView {
            if noteManager.isLoading {
                Text("Loading")
            } else {
                ForEach(noteManager.noteCollection, id: \.self) { note in
                    Text(String(describing: note))
                        .foregroundColor(.accent1)
                }
            }
        }
    }
}

struct NoteTimeline_Previews: PreviewProvider {
    static var previews: some View {
        NoteTimeline()
    }
}
