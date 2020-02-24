//
//  SingleNoteView.swift
//  Dualogue
//
//  Created by Alex Luna on 19/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI
import CoreData

struct SingleNoteView: View {
    @State private var date = Date()
    @State private var images = [String]()
    @State var text: String = ""
    @State var title: String = "click to add your note title"
    @State private var contactName: String = ""
    @State private var contactImage: String = ""
    
    @State private var isEditing: Bool = true
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            GeometryReader { geometry in
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(String(describing: self.date))
                            .font(.caption)
                            .foregroundColor(.accent3)
                        TextField("click to add your note title", text: self.$title)
                            .font(.title)
                            .lineLimit(2)
                            .foregroundColor(Color.main)
                    }
                    .padding()
                    .frame(maxWidth: geometry.size.width*4/5)
                    
                    EmptyAvatar(size: 60)
                        .frame(maxWidth: geometry.size.width*1/5)
                }
                .frame(maxWidth: .infinity, maxHeight: 90)
            }
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
            ZStack {
                Rectangle().fill(Color.accent1)
                    .cornerRadius(20)
                    .padding()
                
                VStack(alignment: .leading) {
                    GeometryReader { geometry in
                        Image("plussign")
                            .position(x: geometry.size.width/2, y: geometry.size.height/2)
                        
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("add image title")
                                    .font(.title)
                                    .lineLimit(1)
                                Text("add comment")
                                    .lineLimit(3)
                                
                            }
                            .foregroundColor(Color.main)
                            .position(x: geometry.size.width/2, y: geometry.size.height-80)
                        }
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 350, maxHeight: 700)
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
                    .frame(maxWidth: .infinity, maxHeight: 400, alignment: .topLeading)
                    .background(Color.mainBG)
                    .foregroundColor(Color.main)
                    .padding(35)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.mainBG)
    }
    
    func storeNote() {
        // TO DO: send note data to NoteManager to store permanently
        // Format DuoNote?
//        let newNote = NoteStorage(context: self.moc)
//        newNote.title = self.title
//        newNote.text = self.text
//        newNote.id = UUID()
//        newNote.date = self.date
//
//        try? self.moc.save()
    }
    
    func clearNote() {
        self.title = "click to add your note title"
        self.text = ""
        self.contactName = ""
        self.contactImage = ""
        self.images = []
    }
}

struct SingleNoteView_Previews: PreviewProvider {
    static var previews: some View {
        SingleNoteView(text: "lelelelalala lelelelalala lelelelalala lelelelalalalelelelalalalelelelalala lelelelalala lelelelalala lelelelalala lelelelalala")
    }
}
