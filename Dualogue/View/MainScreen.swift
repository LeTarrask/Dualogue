//
//  ContentView.swift
//  Dualogue
//
//  Created by Alex Luna on 23/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct MainScreen: View {
    var noteManager = NoteManager()
    
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    TimelinesView()
                        .tabItem {
                            Image(systemName: "1.circle")
                            Text("All your notes")
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
            }
            .navigationBarTitle("Dualogue", displayMode: .inline)
            .navigationBarItems(trailing: Image(systemName: "magnifyingglass"))
            .foregroundColor(.main)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = .black
                nc.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

// MARK: To allow configuring main navigation
// not working, this was supposed to let the background black
struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
    
}
