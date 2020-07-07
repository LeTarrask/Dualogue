//
//  FriendlistScroll.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI
import CoreData

struct FriendListScroll: View {
    @FetchRequest(entity: ContactStorage.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \ContactStorage.contactName_, ascending: true),])
    var contacts: FetchedResults<ContactStorage>
    
    @State var showingDetail = false
    
    @State var selectedContact: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Contacts")
                    .font(.caption).bold()
                    .foregroundColor(.main)
                Spacer()
            }.padding()
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(contacts, id: \.self) { contact in
                        if contact.contactName_ != nil {
                            NavigationLink(
                                destination: SingleContactTimeline(selectedContact: contact.contactName_!),
                                label: {
                                    AvatarView(contactName: contact.contactName_ ?? "Contact Name", contactImage: contact.contactImage_ ?? "face", size: 60)
                                })
                        }
                    }
                }.frame(minHeight: 100)
            }
        }
        .background(Color.mainBG)
    }
}


struct FriendListScroll_Previews: PreviewProvider {
    static var previews: some View {
        FriendListScroll()
    }
}
