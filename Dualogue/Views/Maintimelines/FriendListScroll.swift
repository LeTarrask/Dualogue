//
//  FriendlistScroll.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct FriendListScroll: View {
    @EnvironmentObject var model: FakeModel
    
    @State var showingDetail = false
    
    @State var selectedContact = Contact(contactName: "", contactImage: "")
    
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
                    ForEach(model.contacts, id: \.self) {contact in
                        AvatarView(contact: contact, size: 60)
                            .onTapGesture {
                                self.selectedContact = contact
                                self.showingDetail.toggle()
                            }
                    }
                }.frame(minHeight: 100)
            }
            .sheet(isPresented: $showingDetail) { SingleContactTimeline(selectedContact: selectedContact)
                .environmentObject(model)
            }
        }
        .background(Color.mainBG)
    }
}


struct FriendListScroll_Previews: PreviewProvider {
    static var previews: some View {
        FriendListScroll()
            .environmentObject(FakeModel())
    }
}
