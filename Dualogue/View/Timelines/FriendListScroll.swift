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
            }
            .padding()
            
            ScrollView(.horizontal) {
                HStack {
                    // TO DO: add button here that goes to SingleContactView passing specific contact to it
                    ForEach(contacts, id: \.self) { contact in
                        AvatarView(image: contact.image ?? "face", size: 60, name: contact.name ?? "")
                    }
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
