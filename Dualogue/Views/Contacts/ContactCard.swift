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
                destination: SingleContactTimeline(selectedContact: contact, filterTerm: "Search"),
                label: {
                    AvatarView(for: contact, size: 60)
                        .foregroundColor(.white)
                        .padding()
                })

            NavigationLink(
                destination: self.createNewNoteView(),
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

    func createNewNoteView() -> SingleNoteView {
        let contactSelector = ContactSelector()
        if let wipContact = WipContact(from: contact) {
            contactSelector.contact = wipContact
        }
        let view = SingleNoteView(selectedContact: contactSelector)
        return view
    }
}
