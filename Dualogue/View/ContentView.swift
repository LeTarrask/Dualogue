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
                NewNoteView()
                    .tabItem {
                        Image(systemName: "tv.fill")
                        Text("New Note View")
                }
                ContactsView()
                    .tabItem {
                        Image(systemName: "tv.fill")
                        Text("Contacts View")
                }
            }
            .navigationBarTitle("Dualogue", displayMode: .large)
            .navigationBarItems(trailing: Text("Alert Button"))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
