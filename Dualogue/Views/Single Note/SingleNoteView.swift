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
    
    @ObservedObject var selectedContact = WipContact(contactName: "Contact Name", contactImageName: "face", contactImage: nil)
        
    @State var isEditing: Bool = true
    @State var title: String = "Your string"
    @State var text: String = ""
    @State var contactName: String = "Contact Name"
    @State var contactImage: String = "face"
    @State var date = Date()
    
    let objectWillChange = ObservableObjectPublisher()
        
    var body: some View {
        Group {
            // here i can test the image loading part: if it adds to contact and everything else, instead of state vars
            // or I can just have an array of images sent to AddImageView, and just in this file, I use the newNoteManager
            NoteHeader(selectedContact: selectedContact, date: date.toString(), title: $title, isEditing: $isEditing, contactName: $contactName)
            NoteBodyText(text: $text, isEditing: $isEditing)
            
            if isEditing {
                AddImageView(imageCollection: imageCollection)
            } else {
                // Caroussel(numberOfImages: <#T##Int#>, content: <#T##() -> _#>)
            }
            // TO DO: Fix all layouts with this geometry reader, setting the frames to UIScreen.main.bounds, e então ir descendo para as subviews necessárias
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
        for image in imageCollection.images {
            print(image)
            let imageStore = ImageStorage(context: context)
            imageStore.data = image.imageData.pngData()
            noteStore.images?.adding(imageStore)
        }
        
        // Process contact
        let contactStore = ContactStorage(context: context)
        
        contactStore.contactImage_ = selectedContact.contactImage?.pngData()
        contactStore.contactName_ = selectedContact.contactName
        
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
        contactName = "Contact Name"
        contactImage = "face"
        date = Date()
        
        self.imageCollection.reset()
    }
}

struct SingleNoteView_Previews: PreviewProvider {
    static var previews: some View {
        let imageCollection = ImageCollection()
        return SingleNoteView(imageCollection: imageCollection)
    }
}
