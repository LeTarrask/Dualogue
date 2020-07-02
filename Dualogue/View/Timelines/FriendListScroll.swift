//
//  FriendListScroll.swift
//  Dualogue
//
//  Created by Alex Luna on 18/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI
import CoreData

// TO DO: shouldn't request data from storage here. It should get it from the model that should be bound to some state here
struct FriendListScroll: View {
//    @Environment(\.managedObjectContext) var managedObjectContext
//
//    @FetchRequest(
//        entity: ContactStorage.entity(),
//        sortDescriptors: NSSortDescriptor(keyPath: \ContactStorage.contactName_, ascending: false)
//    )
//    var contacts: FetchedResults<ContactStorage>

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
                    ForEach(1..<5) {_ in
                        AvatarView(image: "face", size: 60, name: "")
                    }
                }.frame(minHeight: 100)
            }
            // TO DO: Add searchbar here
        }
        .background(Color.mainBG)       
    }
}

// TO DO: To simulate image, need fake data
struct FriendListScroll_Previews: PreviewProvider {
    static var previews: some View {
        FriendListScroll()
    }
}
