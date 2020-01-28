//
//  ContactsView.swift
//  Dualogue
//
//  Created by Alex Luna on 28/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct ContactsView: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ForEach(userData.noteCollection) { note in
                // TODO: replace with user visualizer
                VStack{
                    Text(note.user.name)
                    Text(note.text)
                        .lineLimit(3)
                }
            }
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
