//
//  ContactsView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI
import CoreData

struct ContactsView: View {
    @Environment(\.managedObjectContext) var context

    @FetchRequest(entity: ContactStorage.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \ContactStorage.contactName_, ascending: true)])
    var contacts: FetchedResults<ContactStorage>

    var columns: [GridItem] = Array(repeating: .init(.flexible(), alignment: .center), count: 2)

    @State var showingDetail = false

    @State var filterTerm: String = "Search"

    var body: some View {
        VStack {
            SearchBar(filterTerm: $filterTerm)

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
                    ForEach(contacts, id: \.self) { contact in
                        ContactCard(for: contact)
                    }
                }
            }.sheet(isPresented: $showingDetail) {
                NewContactView().environment(\.managedObjectContext, context)
            }
        }

    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
