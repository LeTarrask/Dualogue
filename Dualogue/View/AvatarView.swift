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
    
    /// body
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: size, height: size)
            .border(Color.gray.opacity(0.5), width: 0.5)
            .cornerRadius(size/2)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(image: "face.jpg", size: 36)
    }
}


