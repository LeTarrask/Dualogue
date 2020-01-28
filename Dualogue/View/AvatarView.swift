//
//  AvatarView.swift
//  Dualogue
//
//  Created by Alex Luna on 23/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct AvatarView: View {
    /// image
    let image: String
    
    /// size
    let size: CGFloat
    
    let name: String
    
    /// body
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: size, height: size)
                .border(Color.gray.opacity(0.5), width: 0.5)
                .cornerRadius(size/2)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 3)
                .padding(5)
            Text(name)
                .font(.caption)
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(image: "face", size: 60, name: "Testname")
    }
}


