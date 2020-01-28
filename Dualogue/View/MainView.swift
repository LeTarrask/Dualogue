//
//  MainView.swift
//  Dualogue
//
//  Created by Alex Luna on 28/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var data = NoteBuilderTest()
    
    var body: some View {
        VStack {
            VStack {
                Text("Calendar Button")
                Text("Banner")
            }
            HStack {
                Text("Recent posts")
                Spacer()
                Text("Jan 2017")
            }
            ScrollView(.vertical, content: {
                HStack(spacing: 10) {
                    ForEach(data.noteCollection) { note in
                        NoteCard(note: note)
                    }
                }
                .padding(.leading, 10)
            })
                .frame(height: 190)
        }
    }
}

struct NoteCard: View {
    let note: DuaNote
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                AvatarView(image: note.user.image, size: 48)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                Text(note.user.name)
                    .font(.caption)
            }
            Text(note.text)
                .font(.headline)
                .lineLimit(4)
                .padding(10)
        }
        .background(Color.gray)
        .frame(width: 200).cornerRadius(20)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
