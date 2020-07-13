//
//  SingleNoteView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI
import Combine

struct SingleNoteView: View {
    @Environment(\.managedObjectContext) var context

    @ObservedObject var imageCollection = ImageCollection()

    @ObservedObject var selectedContact = ContactSelector()

    @State var isEditing: Bool = true
    @State var title: String = "Your string"
    @State var text: String = ""
    @State var date = Date() // TO DO: Here, instead of date, it should include hour, as well.

    var body: some View {
        Group {
            NoteHeader(contactSelector: selectedContact, date: date.toString(), title: $title, isEditing: $isEditing)
            NoteBodyText(text: $text, isEditing: $isEditing)

            if isEditing {
                AddImageView(imageCollection: imageCollection)
            } else {
                // Caroussel(numberOfImages: <#T##Int#>, content: <#T##() -> _#>)
            }
            // TO DO: Fix all layouts with this geometry reader,
            // setting the frames to UIScreen.main.bounds, e então ir descendo para as subviews necessárias
        }.navigationBarItems(trailing:
                                HStack {
                                    if !isEditing {
                                        Button("Edit") { isEditing.toggle() }
                                    } else {
                                        Button("Save") { saveNote() }
                                    }

                                }
        )
    }

    private func saveNote() {
        // Creates note storage instance
        let noteStore = NoteStorage(context: context)

        noteStore.title_ = title
        noteStore.text_ = text
        noteStore.date = date

        // Process all images in temp storage
        let imageSet = NSSet(array: [])
        for image in imageCollection.images {
            print(image)
            let imageStore = ImageStorage(context: context)
            imageStore.data = image.imageData.pngData()
            imageSet.adding(imageStore)
        }

        noteStore.images = imageSet

        // Process contact
        if selectedContact.contact.contactName != "Contact Name" {
            // TO DO: Should test if contact already exists
            let contactStore = ContactStorage(context: context)

            contactStore.contactImage_ = selectedContact.contact.contactImage?.pngData()
            contactStore.contactName_ = selectedContact.contact.contactName

            noteStore.contacts = contactStore
        }

        do {
            try context.save()
        } catch {
            print(error)
        }
        resetNote()
    }

    private func resetNote() {
        isEditing = true
        title = "Your string"
        text = ""
        date = Date()

        self.selectedContact.reset()
        self.imageCollection.reset()
    }
}

struct SingleNoteView_Previews: PreviewProvider {
    static var previews: some View {
        SingleNoteView()
    }
}
