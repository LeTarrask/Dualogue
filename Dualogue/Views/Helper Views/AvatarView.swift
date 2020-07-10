//
//  AvatarView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct AvatarView: View {
    let contactName: String
    var contactImage: UIImage = UIImage()
    let size: CGFloat

    var body: some View {
        VStack {
            Image(uiImage: contactImage)
                .resizable()
                .frame(width: size, height: size)
                .cornerRadius(size/2)
                .overlay(Circle().stroke(Color.accent1, lineWidth: 6))
                .overlay(Circle().stroke(Color.main, lineWidth: 2))
                .shadow(radius: 3)
            Text(contactName)
                .lineLimit(2)
                .truncationMode(.tail)
                .frame(width: size*1.3)
                .font(.caption)
        }
    }

    init(for contact: ContactStorage, size: CGFloat) {
        self.contactName = contact.contactName_ ?? "Error loading contact"
        self.size = size
        if let data = contact.contactImage_ {
            if let uiImage = UIImage(data: data) {
                self.contactImage = uiImage
            }
        }
    }

    init(for wipContact: WipContact, size: CGFloat) {
        self.contactName = wipContact.contactName
        self.size = size
        if let uiImage = wipContact.contactImage {
            self.contactImage = uiImage
        }
    }
}

    struct AvatarView_Previews: PreviewProvider {
        static var previews: some View {
            let wipContact = WipContact(contactName: "Tarrask", contactImageName: "face", contactImage: nil)
            return AvatarView(for: wipContact, size: 60)
        }
    }
