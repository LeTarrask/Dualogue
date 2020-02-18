//
//  NewNoteView.swift
//  Dualogue
//
//  Created by Alex Luna on 28/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

// TO DO:
//implement editing capability
//implement app design
//implement storage/retrieval methods

struct SingleNoteView: View {
    @EnvironmentObject var userData: UserData
    
    @State private var noteTitle: String = ""
    @State private var noteText: String = ""
    @State private var noteContact: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Note"), content: {
                    TextField("Title", text: $noteTitle)
                    TextField("Note", text: $noteText)
                        .lineLimit(nil)
                })
                Section(header: Text("Contact"), content: {
                    Picker(selection: $noteContact, label: Text("Contact")) {
                        // TODO: Add contact picker here
                        Text("teste")
                    }
                })
                Button(action: {self.savePressed()}) {Text("Save")}
            }
            .navigationBarTitle("Create New Dualogue")
        }
    }
    
    func savePressed() {
        let contact = DuaUser(name: noteContact, image: "face")
        let newNote = DuaNote(title: noteTitle)
        
        userData.noteCollection.append(newNote)
        
        resetView()
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
    }
    
    func resetView() {
        noteTitle = ""
        noteText = ""
        noteContact = ""
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        SingleNoteView()
    }
}
