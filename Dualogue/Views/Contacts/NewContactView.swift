//
//  NewContactView.swift
//  Dualogue
//
//  Created by Alex Luna on 01/07/2020.
//

import SwiftUI
import CoreData

struct NewContactView: View {
    @Environment(\.managedObjectContext) var context

    @State var contactName: String = ""
    @State var contactImage: String = ""

    var selectedContact = ContactSelector()

    @State var showContactPicker: Bool = false

    var body: some View {
        Form {
            TextField("Contact Name", text: $contactName)

            Text("Choose from your Contacts")
            Button(action: {
                self.showContactPicker.toggle()
            }, label: {
                AvatarView(for: WipContact(contactName: contactName,
                                           contactImageName: contactImage,
                                           contactImage: nil),
                           size: 60)
            })

            Button(action: {
                self.storeContact()
            }, label: {
                Text("Save contact")
            })
            // swiftlint:disable multiple_closures_with_trailing_closure
        }.sheet(isPresented: $showContactPicker, onDismiss: { }) {
            ContactPicker(showPicker: $showContactPicker,
                          onSelectContact: { selected in
                            self.contactName = selected.namePrefix + " " + selected.nameSuffix
                            self.selectedContact.contact.contactName = self.contactName
                            if selected.imageDataAvailable {
                                selectedContact.contact.contactImage = UIImage(data: selected.imageData!)
                            }
            })
        }
    }

    private func storeContact() {
        // Process contact
        print("storing contact")

        // TO DO: Should test if contact already exists
        let contactStore = ContactStorage(context: context)
        contactStore.contactName_ = contactName

        if selectedContact.contact.contactImage != nil {
            contactStore.contactImage_ = selectedContact.contact.contactImage?.pngData()
        }

        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}
