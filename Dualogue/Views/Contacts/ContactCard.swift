//
//  ContactCard.swift
//  Dualogue
//
//  Created by Alex Luna on 01/07/2020.
//

import SwiftUI

struct ContactCard: View {
    var contact: ContactStorage
    var image: Image = Image("face")
    var name: String

    init(for contact: ContactStorage) {
        self.contact = contact
        self.name = contact.contactName_ ?? "Error Loading Name"
        if let data = contact.contactImage_ {
            if let uiImage = UIImage(data: data) {
                self.image = Image(uiImage: uiImage)
            }
        }
    }

    var body: some View {
        VStack {
            NavigationLink(
                destination: SingleContactTimeline(selectedContact: contact),
                label: {
                    AvatarView(for: contact, size: 60)
                        .foregroundColor(.white)
                        .padding()
                })

            NavigationLink(
                destination: SingleNoteView(),
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
