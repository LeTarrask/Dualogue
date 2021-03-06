//
//  ContactCard.swift
//  Dualogue
//
//  Created by Alex Luna on 01/07/2020.
//

import SwiftUI

struct ContactCard: View {
    var image: String
    var name: String
        
    var body: some View {
        VStack {
            Button(action: {
                print("sheet touched")
                // Should go to single contact
            }) {
                AvatarView(contactName: name, contactImage: image, size: 120)
                    .foregroundColor(.white)
                    .padding()
            }
            
            
            Button(action: {
                // TO DO: call create note
            }, label: {
                Text("CREATE NOTE")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 20)
                                    .accentColor(.accent3))
            })
        }
        .padding(10)
        .background(Color.accent1)
        .cornerRadius(20)
    }
}

struct ContactCard_Previews: PreviewProvider {
    static var previews: some View {
        ContactCard(image: "face", name: "tarrask")
    }
}
