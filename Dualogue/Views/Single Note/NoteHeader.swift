//
//  NoteHeader.swift
//  Dualogue
//
//  Created by Alex Luna on 30/06/2020.
//

import SwiftUI
import ContactsUI

struct NoteHeader: View {
    var date: String
    @Binding var title: String
    @Binding var isEditing: Bool
    
    @Binding var contactName: String
    @Binding var contactImage: String
    
    @State var contact: CNContact?
    
    @State var showPicker: Bool = false
    
    var body: some View {
        ZStack {
            ContactPicker(
                showPicker: $showPicker,
                onSelectContact: { contact in
                    self.contact = contact
                    self.contactName = contact.givenName + " " + contact.familyName
                    
                    // TO DO: create a static func for ImageStorage, so I can reuse this code in other parts of the app.
                    if contact.imageDataAvailable {
                        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                        var path = paths[0]
                        self.contactImage = self.contactName + ".jpg"
                        path.appendPathComponent(self.contactImage)
                        if let imageData = contact.imageData {
                            print("Image Data Found")
                            do {
                                print("Trying to save image")
                                try imageData.write(to: path, options: [])
                            } catch {
                                print(error)
                            }}}})
            
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
                    AvatarView(contactName: contactName, contactImage: contactImage, size: 60)
                })
                
            }
            .padding()
        }
    }
}


