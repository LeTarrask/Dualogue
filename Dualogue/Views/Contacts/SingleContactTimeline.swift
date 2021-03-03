//
//  SingleContactView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct SingleContactTimeline: View {
    @EnvironmentObject var model: DataController
    
    var contactName: String
    
    var contact: FetchRequest<ContactStorage>
    
    init(_ name: String) {
        self.contactName = name
        
        let predicate = NSPredicate(format: "contactName = %d", contactName)
        
        contact = FetchRequest<ContactStorage>(entity: ContactStorage.entity(),
                                               sortDescriptors: [NSSortDescriptor(keyPath: \ContactStorage.contactName, ascending: false)],
                                               predicate: predicate)
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(contact.wrappedValue.first?.contactName ?? "no contact found")
                //                AvatarView(contact: selectedContact, size: 60)
                VStack {
                    Text(String(describing: contact.wrappedValue.first?.note?.count))
                    Text("notes")
                }
            }
            Button(action: {
                // TO DO: call create note
            }, label: {
                Text("Create note")
            })
            
            SearchBar()
            
            NoteTimeline(filterName: contactName)
        }
    }
}

struct SingleContactView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    
    static var previews: some View {
        SingleContactTimeline("Contato 1")
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
