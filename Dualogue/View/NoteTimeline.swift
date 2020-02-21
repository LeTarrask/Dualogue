//
//  NoteTimeline.swift
//  Dualogue
//
//  Created by Alex Luna on 18/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct NoteTimeline: View {
    @FetchRequest(entity: NoteStorage.entity(), sortDescriptors: []) var notes: FetchedResults<NoteStorage>
    
    var body: some View {
        ScrollView {
            ForEach(notes, id: \.self) { note in
                Text(String(describing: note))
                    .foregroundColor(.accent1)
                
                //This solution is not working, probably because it takes too long to load the data, create the views and then show them. we need to implement some sort of loader before displaying the data
                //                NotePreView(title: note.title ?? "",
                //                            date: note.date ?? "",
                //                            text: note.text ?? "",
                //                            completed: false,
                //                            contactName: note.contactName ?? "",
                //                            contactImg: note.contactImage ?? "",
                //                            isExpanded: false)
            }
        }
    }
}

struct NoteTimeline_Previews: PreviewProvider {
    static var previews: some View {
        NoteTimeline()
    }
}
