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

    var body: some View {
        Form {
            TextField("Contact Name", text: $contactName)

            Button(action: {
                // TO DO: Call contact picker
            }, label: {
                AvatarView(contactName: contactName, contactImage: contactImage, size: 60)
            })

            Button(action: {
                // TO DO: store this property contact to DB
            }, label: {
                Text("Save contact")
            })
        }
    }
}

