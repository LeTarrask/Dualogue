//
//  FriendListScroll.swift
//  Dualogue
//
//  Created by Alex Luna on 18/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct FriendListScroll: View {
    @FetchRequest(entity: ContactStorage.entity(), sortDescriptors: [])
    var contacts: FetchedResults<ContactStorage>
    
    var body: some View {
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
            
            ScrollView(.horizontal) {
                HStack {
                    // TO DO: implement model generator for friend list
                    
                    // TO DO: For each (contacts, id: \.self) { contact in
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
                }.frame(minHeight: 100)
            }
            // TO DO: Add searchbar here
        }
        .background(Color.mainBG)
        
        
    }
}

struct FriendListScroll_Previews: PreviewProvider {
    static var previews: some View {
        FriendListScroll()
    }
}
