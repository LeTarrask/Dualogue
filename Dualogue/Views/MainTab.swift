//
//  ContentView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct MainTab: View {
    @Environment(\.managedObjectContext) var context
    
    @State private var selection = 0
    
    // var model = FakeModel() OLD CODE FOR TESTING
    
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
        .environment(\.managedObjectContext, self.context)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}
