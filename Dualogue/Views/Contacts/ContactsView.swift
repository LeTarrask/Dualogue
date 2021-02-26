//
//  ContactsView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct ContactsView: View {
    @EnvironmentObject var model: FakeModel
    
    var body: some View {
        VStack() {
            SearchBar()
            
            ContactsGrid()
        }
    }
}

struct ContactsGrid: View {
    @EnvironmentObject var model: FakeModel
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(), alignment: .center), count: 2)
    
    @State var showingDetail = false
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 5) {
                Button(action: {
                    print("New touched")
                    self.showingDetail.toggle()
                    
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white).font(.title)
                        .frame(width: 190, height: 210)
                        .padding(10)
                        .background(Color.accent2)
                        .cornerRadius(20)
                    
                })
                ForEach(model.contacts, id: \.self) { contact in
                    ContactCard(contact: contact)
                        .environmentObject(model)
                }
            }
        }.sheet(isPresented: $showingDetail) {
            NewContactView()
                .environmentObject(model)
        }
    }
}


struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
            .environmentObject(FakeModel())
    }
}
