//
//  ContentView.swift
//  Dualogue
//
//  Created by Alex Luna on 23/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                MainView()
                    .tabItem {
                        Image(systemName: "phone.fill")
                        Text("Home")
                }
                Text("The content of the second view")
                    .tabItem {
                        Image(systemName: "tv.fill")
                        Text("CalendarView")
                }
                Text("The content of the third view")
                    .tabItem {
                        Image(systemName: "tv.fill")
                        Text("New Note View")
                }
                Text("The content of the fourth view")
                    .tabItem {
                        Image(systemName: "tv.fill")
                        Text("Notes View")
                }
                Text("The content of the fifth view")
                    .tabItem {
                        Image(systemName: "tv.fill")
                        Text("Contacts View")
                }
            }
            .navigationBarTitle("Dualogue", displayMode: .inline)
            .navigationBarItems(trailing: Text("Alert Button"))
        }
    }
}

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
                        NotePreview(note: note)
                    }
                }
                .padding(.leading, 10)
            })
                .frame(height: 190)
        }
    }
}

struct NotePreview: View {
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



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
