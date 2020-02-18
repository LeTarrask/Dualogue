//
//  FriendListScroll.swift
//  Dualogue
//
//  Created by Alex Luna on 18/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

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
            }.frame(minHeight: 100)
        }
    }
}

struct FriendListScroll_Previews: PreviewProvider {
    static var previews: some View {
        FriendListScroll()
    }
}
