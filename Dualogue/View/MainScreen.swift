//
//  ContentView.swift
//  Dualogue
//
//  Created by Alex Luna on 23/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI
import CoreData

struct MainScreen: View {
    @Environment(\.managedObjectContext) var context
        
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    TimelinesView()
                        .tabItem {
                            Image(systemName: "1.circle")
                            Text("All your notes")
                    }.tag(0)
//                    SingleNoteView()
//                        .tabItem {
//                            Image(systemName: "2.circle")
//                            Text("Add note")
//                    }.tag(1)
//                    ContactsView()
//                        .tabItem {
//                            Image(systemName: "3.circle")
//                            Text("Contacts")
//                    }.tag(2)
                }
                
            }
            .navigationBarTitle("Dualogue", displayMode: .inline)
            .navigationBarItems(trailing: Image(systemName: "magnifyingglass"))
            .foregroundColor(.main)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
