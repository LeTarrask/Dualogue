//
//  SingleNoteView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct SingleNoteView: View {
    @EnvironmentObject var notesModel: NotesViewModel
        
    @State var isEditing: Bool = true
    @State var title: String = "Your string"
    @State var text: String = ""
    @State var contactName: String = "Contact Name"
    @State var contactImage: String = "face"
    @State var date = Date()
    @State var images: [String] = ["teste1", "teste2", "teste3"]
    
    func resetNote() {
        isEditing = false
        title = "Your string"
        text = ""
        contactName = "Contact Name"
        contactImage = "face"
        date = Date()
        images = [String]()
    }
    
    var body: some View {
        Group {
            //NoteHeader(date: date.toString(), title: $title, isEditing: $isEditing, contactName: $contactName, contactImage: $contactImage)
            NoteBodyText(text: $text, isEditing: $isEditing)
            
            if isEditing {
                AddImageView(images: $images)
            } else {
                // Caroussel(numberOfImages: <#T##Int#>, content: <#T##() -> _#>)
            }
            // TO DO: Fix all layouts with this geometry reader, setting the frames to UIScreen.main.bounds, e então ir descendo para as subviews necessárias
        }.navigationBarItems(trailing:
                                HStack {
                                    if !isEditing {
                                        Button("Edit") {}
                                    } else {
                                        Button("Save") { saveNote() }
                                    }
                                    
                                    
                                }
        )
    }
    
    func saveNote() {
        notesModel.saveNote()
    }
}

struct SingleNoteView_Previews: PreviewProvider {
    static var previews: some View {
        SingleNoteView()
    }
}
