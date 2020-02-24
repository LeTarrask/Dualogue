//
//  AvatarView.swift
//  Dualogue
//
//  Created by Alex Luna on 23/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

// TO DO:
//INIT empty image & empty text

struct AvatarView: View {
    var image: String
    let size: CGFloat
    let name: String
    
    /// body
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: size, height: size)
                .cornerRadius(size/2)
                .overlay(Circle().stroke(Color.accent1, lineWidth: 6))
                .overlay(Circle().stroke(Color.main, lineWidth: 2))
                .shadow(radius: 3)
            Text(name)
                .lineLimit(2)
                .truncationMode(.tail)
                .frame(width: size*1.3)
                .font(.caption)
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(image: "face", size: 60, name: "contact")
    }
}


