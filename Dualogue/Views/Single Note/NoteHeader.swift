//
//  NoteHeader.swift
//  Dualogue
//
//  Created by Alex Luna on 30/06/2020.
//

import SwiftUI
import ContactsUI

struct NoteHeader: View {
    @ObservedObject var contactSelector: ContactSelector

    var date: String
    @Binding var title: String
    @Binding var isEditing: Bool

    @State var showPicker: Bool = false

    var isEdited: Bool = false

    var body: some View {
        ZStack {
            ContactPicker(
                showPicker: $showPicker,
                onSelectContact: { contact in
                    contactSelector.contact.contactName = contact.givenName + " " + contact.familyName

                    if contact.imageDataAvailable {
                        contactSelector.contact.contactImage = UIImage(data: contact.imageData!)
                    }
                    /* TO DO: Here it should ask the view to refresh and update the Avatarview
                     It actually refreshes when I select am image in imageloader
                     */
                })

            HStack {
                VStack(alignment: .leading) {
                    Text(date)
                        .font(.caption)
                        .foregroundColor(.accent3)
                    if isEditing {
                        TextField("Write your note", text: $title)
                    } else {
                        Text(title)
                    }
                }
                Spacer()
                Button(action: {
                    self.showPicker.toggle()
                }, label: {
                    AvatarView(for: contactSelector.contact, size: 60)
                })

            }
            .padding()
        }
    }
}
