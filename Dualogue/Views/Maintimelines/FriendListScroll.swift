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
    var fetchedContacts: FetchedResults<ContactStorage>
    
    @State var showingDetail = false
        
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
//                    ForEach(fetchedContacts, id: \.self) { contact in
//                        NavigationLink(destination: {
//                            Text("")
//                        }) {
//                            AvatarView(for: contact, size: 60)
//                        }
//                    }
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
