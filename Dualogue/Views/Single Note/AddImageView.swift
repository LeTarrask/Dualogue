//
//  AddImageView.swift
//  Dualogue
//
//  Created by Alex Luna on 07/07/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct AddImageView: View {
    @Binding var images: [String]
    
    var rows: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    
    var body: some View {
        ScrollView {
            LazyHGrid(rows: rows, alignment: .center, spacing: 10) {
                AddImageButton()
                    .onTapGesture {
                        // call image picker, add selected image to array images
                        // https://developer.apple.com/videos/play/wwdc2020/10652
                    }
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                        .cornerRadius(5)
                }
            }
        }.frame(height: 110)
    }
}

struct AddImageButton: View {
    // TO DO: make this button pretty
    var body: some View {
        Color.blue
            .frame(width: 100, height: 100, alignment: .center)
            .cornerRadius(5)
    }
}

struct AddImageView_Previews: PreviewProvider {
    static var previews: some View {
        AddImageView(images: .constant(["teste1", "teste2", "teste3"]))
    }
}
