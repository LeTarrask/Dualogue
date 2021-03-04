//
//  ContactsGrid.swift
//  Dualogue
//
//  Created by Alex Luna on 03/03/2021.
//

import SwiftUI

struct ContactsGrid: View {
    @EnvironmentObject var model: DataController
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(), alignment: .center), count: 2)
    
    @State var showingDetail = false
    
    let contacts: FetchRequest<ContactStorage>
    
    init() {
        contacts = FetchRequest<ContactStorage>(entity: ContactStorage.entity(),
                                                sortDescriptors: [NSSortDescriptor(keyPath: \ContactStorage.contactName, ascending: false)])
    }
    
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
                ForEach(contacts.wrappedValue, id: \.self) { contact in
                    ContactCard(image: "face", name: contact.contactName ?? "")
                }
            }
        }.sheet(isPresented: $showingDetail) {
//            NewContactView()
        }
    }
}


struct ContactsGrid_Previews: PreviewProvider {
    static var dataController = DataController.preview

    static var previews: some View {
        ContactsGrid()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
