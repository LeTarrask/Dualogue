//
//  SingleNoteView.swift
//  Dualogue
//
//  Created by Alex Luna on 19/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI
import CoreData

// TO DO: add animations on clear

struct SingleNoteView: View {
    @Environment(\.managedObjectContext) var moc
    
    private var date = Date()
    
    @State private var imageStore = ImageStore()
    @State var text: String = ""
    @State var title: String = "Click to add your note title"
    @State var contact: DuaContact?
    
    @State var showingContacts = false
    
    @State private var isEditing: Bool = true
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            GeometryReader { geometry in
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(self.date.toString())
                            .font(.caption)
                            .foregroundColor(.accent3)
                        TextField("click to add your note title", text: self.$title)
                            .font(.title)
                            .lineLimit(2)
                            .foregroundColor(Color.main)
                    }
                    .padding()
                    .frame(maxWidth: geometry.size.width*4/5)
                    
                    
                    Button(action: {
                        self.showingContacts.toggle()
                        let contact = DuaContact(name: "Store nome", image: "face")
                        self.contact = contact
                    }) {
                        if (self.contact?.name == nil) {
                            EmptyAvatar(size: 60)
                        } else {
                            AvatarView(image: self.contact?.image ?? "face", size: 60, name: self.contact?.name ?? "")
                        }
                    }
                    .sheet(isPresented: self.$showingContacts, content: {
                        EmbeddedContactPicker()
                    })
                }
            }.frame(maxWidth: .infinity, minHeight: 110, maxHeight: 150)
                .padding()
                .padding(.top, 40)
            HStack {
                Button(action: {
                    self.clearNote()
                }, label: {
                    Text("NEW NOTE")
                        .font(.callout)
                        .foregroundColor(.accent1)
                        .padding()
                        .background(Color.accent2)
                        .cornerRadius(15)
                    
                })
                Button(action: {
                    self.storeNote()
                }, label: {
                    Text("SAVE NOTE")
                        .font(.callout)
                        .foregroundColor(.accent1)
                        .padding()
                        .background(Color.accent3)
                        .cornerRadius(15)
                })
            }
            
            HStack {
                if isEditing {
                    // TO DO: make this button add images to imagecollection
                    ZStack {
                        Rectangle().fill(Color.accent1)
                            .cornerRadius(20)
                            .padding()
                        
                        VStack {
                            GeometryReader { geometry in
                                Image("plussign")
                                    .position(x: geometry.size.width/2, y: geometry.size.height/2)
                                
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading) {
                                        Text("Add title")
                                            .font(.title)
                                            .lineLimit(1)
                                        Text("Add text")
                                            .lineLimit(3)
                                        
                                    }
                                    .foregroundColor(Color.main)
                                    .position(x: geometry.size.width/2, y: geometry.size.height-80)}}}
                    }
                }
                ForEach(imageStore.images, id: \.self) { duaImage in
                    ImageView(duaImage: duaImage)
                }
            }
            
            
            if isEditing {
                TextField("", text: $text)
                    .padding(20)
                    .frame(maxWidth: .infinity, maxHeight: 400, alignment: .topLeading)
                    .background(Color.main)
                    .foregroundColor(Color.mainBG)
                    .cornerRadius(20)
                    .padding(20)
            } else {
                Text(text)
                    .lineLimit(0)
                    .frame(maxWidth: .infinity, maxHeight: 400, alignment: .topLeading)
                    .background(Color.mainBG)
                    .foregroundColor(Color.main)
                    .padding(35)
            }
        }
        .background(Color.mainBG)
    }
}

// MARK: - Actions to clear and store information into a note that is sent to CoreData
extension SingleNoteView {
    func storeNote() {
        let newNote = NoteStorage(context: self.moc)
        newNote.title = title
        newNote.text = text
        newNote.date = date
        
        if contact?.name != nil {
            // TO DO: Check if contact already exists in moc
            let newContact = ContactStorage(context: self.moc)
            newContact.name = contact?.name
            newContact.image = contact?.image
            
            newNote.contacts = newContact
        }
        
        do {
            try self.moc.save()
            print("Saving new note")
            clearNote()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func clearNote() {
        self.title = "click to add your note title"
        self.text = ""
        self.contact = nil
        self.imageStore = ImageStore()
    }
}

