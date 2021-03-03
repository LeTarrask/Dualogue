//
//  NewContactView.swift
//  Dualogue
//
//  Created by Alex Luna on 01/07/2020.
//

import SwiftUI

//struct NewContactView: View {
//    @EnvironmentObject var model: DataController
//    
//    @State var contactName: String = ""
//    @State var contactImage: String = ""
//        
//    var body: some View {
//        Form {
//            TextField("Contact Name", text: $contactName)
//            
//            if contact != nil {
//                AvatarView(contactName: contactName, contactImage: contactImage, size: 60)
//            } else {
//                Button(action: {
//                    // TO DO: Call contact picker
//                }, label: {
//                    AvatarView(contactName: "Choose a contact", contactImage: "face", size: 60)
//                })
//            }
//            
//            Button(action: {
//                self.contact = Contact(contactName: contactName, contactImage: contactImage)
//                // TO DO: store this property contact to DB
//            }, label: {
//                Text("Save contact")
//            })
//        }
//    }
//}
//
//struct NewContactView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewContactView()
//            .environmentObject(DataController())
//    }
//}
