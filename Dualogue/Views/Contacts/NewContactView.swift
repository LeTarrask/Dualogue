//
//  NewContactView.swift
//  Dualogue
//
//  Created by Alex Luna on 01/07/2020.
//

import SwiftUI
import CoreData

struct NewContactView: View {
    @State var contactName: String = ""
    @State var contactImage: String = ""

    @State var showContactPicker: Bool = false

    var body: some View {
        Form {
            TextField("Contact Name", text: $contactName)

            Text("Choose a contact")
            Button(action: {
                self.showContactPicker.toggle()
            }, label: {
                AvatarView(for: WipContact(contactName: contactName,
                                           contactImageName: contactImage,
                                           contactImage: nil),
                           size: 60)
            })

            Button(action: {
                // TO DO: store this property contact to DB
            }, label: {
                Text("Save contact")
            })
            // swiftlint:disable multiple_closures_with_trailing_closure
        }.sheet(isPresented: $showContactPicker, onDismiss: { }) {
            // TO DO: Lint this
            ContactPicker(showPicker: $showContactPicker,
                          onSelectContact: { selected in
                self.contactName = selected.namePrefix + " " + selected.nameSuffix
            })
        }
    }
}
