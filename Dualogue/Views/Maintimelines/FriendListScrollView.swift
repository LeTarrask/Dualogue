//
//  FriendlistScroll.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct FriendListScrollView: View {
    @EnvironmentObject var model: DataController
    
    let contacts: FetchRequest<ContactStorage>
    
    @State var showingDetail = false
    
    @State var selectedContact = ""
    
    init() {
        contacts = FetchRequest<ContactStorage>(entity: ContactStorage.entity(), sortDescriptors: [
            NSSortDescriptor(keyPath: \ContactStorage.contactName, ascending: false)
        ])
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Friends")
                    .font(.title).bold()
                    .foregroundColor(.main)
                Spacer()
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(contacts.wrappedValue, id: \.self) { contact in
                        AvatarView(contactName: contact.name, contactImage: "face", size: 60)
                            .onTapGesture {
                                self.selectedContact = contact.contactName ?? ""
                                self.showingDetail.toggle()
                            }
                    }
                }.frame(minHeight: 100)
            }
            .sheet(isPresented: $showingDetail) {
                SingleContactTimeline(selectedContact)
                    .environmentObject(model)
            }
        }
        .background(Color.mainBG)
    }
}


struct FriendListScroll_Previews: PreviewProvider {
    static var dataController = DataController.preview
    
    static var previews: some View {
        FriendListScrollView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
