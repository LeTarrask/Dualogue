//
//  AvatarView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct AvatarView: View {
    let contact: Contact
    let size: CGFloat
    
    var body: some View {
        VStack {
            Image(contact.contactImage)
                .resizable()
                .frame(width: size, height: size)
                .cornerRadius(size/2)
                .overlay(Circle().stroke(Color.accent1, lineWidth: 6))
                .overlay(Circle().stroke(Color.main, lineWidth: 2))
                .shadow(radius: 3)
            Text(contact.contactName)
                .lineLimit(2)
                .truncationMode(.tail)
                .frame(width: size*1.3)
                .font(.caption)
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        let contact = Contact(contactName: "tarrask", contactImage: "face")
        return AvatarView(contact: contact, size: 60)
    }
}
