//
//  ImageView.swift
//  Dualogue
//
//  Created by Alex Luna on 10/03/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    var duaImage: DuaImage
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color.mainBG)
                .cornerRadius(20)
                .padding()
            
            Image(self.duaImage.image).resizable()
                .scaledToFit()
                .padding()
            
            VStack (alignment: .leading) {
                Spacer()
                Text("duaImage.titleduaImage.titleduaImage.titleduaImage.titleduaImage.title")
                    .font(.title)
                    .lineLimit(1)
                Text("duaImage.text")
                    .lineLimit(3)
                }
            .padding()
            .foregroundColor(Color.accent2)
        }.frame(height: 300)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(duaImage: DuaImage(image: "face"))
    }
}
