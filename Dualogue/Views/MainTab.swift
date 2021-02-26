//
//  ContentView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct MainTab: View {
    @State private var selection = 0
    
    var model = FakeModel()
    
    // TO DO: here we should fetch the database, and bind the data to the views. So we send all the notes to notelist view, and all the contacts to contactlistview. Singlenoteview goes to a new note in editing mode on.
    
    var body: some View {
        TabView(selection: $selection) {
            NotelistView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Your notes")
                }.tag(0)
            SingleNoteView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Add note")
                }.tag(1)
            ContactsView()
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Contacts")
                }.tag(2)
        }
        .environmentObject(model)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}
