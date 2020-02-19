//
//  EmptyAvatar.swift
//  Dualogue
//
//  Created by Alex Luna on 19/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct EmptyAvatar: View {
    let image = "plussign"
    let size: CGFloat
    let name = "contact"
    
    /// body
    var body: some View {
        VStack {
            ZStack {
                Circle().frame(width: size, height: size)
                .overlay(Circle().stroke(Color.accent1, lineWidth: 6))
                .overlay(Circle().stroke(Color.main, lineWidth: 2))
                .shadow(radius: 3)
                Image(image)
            }
            Text(name)
                .lineLimit(2)
                .truncationMode(.tail)
                .frame(width: size * 1.3)
                .font(.caption)
        }
    }
}

struct EmptyAvatar_Previews: PreviewProvider {
    static var previews: some View {
        EmptyAvatar(size: 60)
    }
}
