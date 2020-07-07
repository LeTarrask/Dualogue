//
//  ContactCard.swift
//  Dualogue
//
//  Created by Alex Luna on 01/07/2020.
//

import SwiftUI

struct ContactCard: View {
    var image: String
    var name: String
        
    var body: some View {
        VStack {
            NavigationLink(
                destination: SingleContactTimeline(selectedContact: name),
                label: {
                    AvatarView(contactName: name, contactImage: image, size: 60)
                        .foregroundColor(.white)
                        .padding()
                })

            NavigationLink(
                destination: SingleNoteView(contactName: name, contactImage: image),
                label: {
                    Text("CREATE NOTE")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 20)
                                        .accentColor(.accent3))
                })
        }
        .padding(10)
        .background(Color.accent1)
        .cornerRadius(20)
    }
}
