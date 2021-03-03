//
//  AvatarView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct AvatarView: View {
    let contactName: String
    let contactImage: String
    let size: CGFloat
    
    var body: some View {
        VStack {
            Image(contactImage)
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
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(contactName: "tarrask", contactImage: "face", size: 60)
    }
}
