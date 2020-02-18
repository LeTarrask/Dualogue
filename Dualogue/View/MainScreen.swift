//
//  ContentView.swift
//  Dualogue
//
//  Created by Alex Luna on 23/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Friends")
                            .font(.title).bold()
                            .foregroundColor(.main)
                        Spacer()
                        Text("View Contacts")
                            .font(.caption)
                            .foregroundColor(.accent3)
                    }
                    
                    FriendListScroll()
                    // TO DO: Add searchbar here
                }
                .background(Color.mainBG)
                
                NoteTimeline()
                
                // TO DO: implement tabbar
            }
            .navigationBarTitle("Dualogue", displayMode: .inline)
            .foregroundColor(.main)
            .navigationBarItems(trailing: Image(systemName: "magnifyingglass"))
            .foregroundColor(.main)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = .black
                nc.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            })
        }
    }
}


struct AddNewNoteButton: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button(action: {
            print("button pressed")
            self.animationAmount = 1.1
        }) {
            Image(systemName: "plus")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding()
                .background(Color.blue)
                .mask(Circle())
                .scaleEffect(animationAmount)
                .animation(
                    Animation
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false))
            
        }
        .onAppear {
            self.animationAmount = 1
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
