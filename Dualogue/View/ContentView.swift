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
            VStack {
                VStack(alignment: .leading) {
                    Text("Contacts")
                        .font(.title).bold()
                    
                    ScrollView(.horizontal) {
                        HStack {
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
                        }
                    }
                
                }
                .padding(20)
                .background(Color.white)
                Spacer()
                ScrollView(.vertical) {
                    NoteView(title: "test", date: "test", imagePath: "face2")

                    NoteView(title: "test", date: "test", contactImg: "face")

                }
            }
            .background(Color.black)
            .navigationBarTitle("Dualogue", displayMode: .inline)
            .navigationBarItems(trailing: Image(systemName: "magnifyingglass"))
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
