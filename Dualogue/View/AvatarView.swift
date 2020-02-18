//
//  AvatarView.swift
//  Dualogue
//
//  Created by Alex Luna on 23/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

// TO DO:
// 3 different sizes of avatars & names

//Type 1: (for main screen story scroll)
//text regular size 12
//Image 60px
//border grey 2px
//larger border white 4px

//Type 2: (for note)
//text regular size 12
//Image 50px
//border grey 2px
//larger border white 4px

//Type 3: (for user page)
//text semibold size 12
//Image 100px
//border grey 2px
//larger border white 4px

//INIT empty image & empty text

struct AvatarView: View {
    let image: String
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
        AvatarView(image: "face", size: 60, name: "Testname TestnameTestname")
    }
}


