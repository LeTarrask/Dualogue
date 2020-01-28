//
//  NewNoteView.swift
//  Dualogue
//
//  Created by Alex Luna on 28/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct NewNoteView: View {
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
        print("save pressed")
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
    }
}
