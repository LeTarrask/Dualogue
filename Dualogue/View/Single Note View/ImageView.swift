//
//  ImageView.swift
//  Dualogue
//
//  Created by Alex Luna on 10/03/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    var image: String
    var title: String
    var subtitle: String
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color.mainBG)
                .cornerRadius(20)
                .padding()
            
            Image(self.image)
                .resizable()
                .scaledToFit()
                .padding()
            
            VStack (alignment: .leading) {
                Spacer()
                Text(self.title)
                    .font(.title)
                    .lineLimit(1)
                Text(self.subtitle)
                    .lineLimit(3)
                }
            .padding()
            .foregroundColor(Color.accent2)
        }.frame(height: 300)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: "face", title: "image title", subtitle: "subtitle title")
    }
}
