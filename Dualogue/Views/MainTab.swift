//
//  ContentView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct MainTab: View {   
    @State private var selection = 0
            
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                NotelistView()
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("Your notes")
                    }.tag(0)
                
                ContactsView()
                    .tabItem {
                        Image(systemName: "3.circle")
                        Text("Contacts")
                    }.tag(1)
            }
            .navigationBarTitle(Text("Dualogue"), displayMode: .inline)
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: SingleNoteView(),
                                        label: {
                                            Image(systemName: "plus")
                                        }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return MainTab()
    }
}
