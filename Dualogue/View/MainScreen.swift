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
                .padding(20)
                .background(Color.mainBG)
                Spacer()
                ZStack {
                    NoteTimeline()
                }
                
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

struct NoteTimeline: View {
    var body: some View {
        ScrollView(.vertical) {
            // TO DO: implement model generator for notes with different types
            NotePreView(title: "test", date: "test", contactName: "teso", contactImg: "face")
            
            NotePreView(title: "test", date: "test", imagePath: "face2")
            
            NotePreView(title: "test", date: "test", contactName: "teso", contactImg: "face")
            
            NotePreView(title: "test", date: "test", contactName: "teso", contactImg: "face")
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

struct FriendListScroll: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                // TO DO: implement model generator for friend list
                AvatarView(image: "face", size: 60, name: "Testname")
                AvatarView(image: "face", size: 60, name: "Testname")
                AvatarView(image: "face2", size: 60, name: "Testname")
                AvatarView(image: "face2", size: 60, name: "Testname")
                AvatarView(image: "face", size: 60, name: "Testname")
                AvatarView(image: "face2", size: 60, name: "Testname")
                AvatarView(image: "face", size: 60, name: "Testname")
                AvatarView(image: "face", size: 60, name: "Testname")
                AvatarView(image: "face", size: 60, name: "Testname")
                AvatarView(image: "face", size: 60, name: "Testname")
                // TO DO: when implementing this functionality, remove padding from sides
            }.frame(minHeight: 90)
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
