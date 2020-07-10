//
//  AddImageView.swift
//  Dualogue
//
//  Created by Alex Luna on 07/07/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct AddImageView: View {
    @ObservedObject var imageCollection: ImageCollection

    @State var showImagePicker: Bool = false

    var images: [UIImage] {
        var array = [UIImage]()
        for imageModel in imageCollection.images {
            array.append(imageModel.imageData)
        }
        return array
    }

    var rows: [GridItem] = Array(repeating: .init(.flexible()), count: 1)

    var body: some View {
        ScrollView {
            LazyHGrid(rows: rows, alignment: .center, spacing: 10) {
                AddImageButton()
                    .onTapGesture {
                        // call image picker
                        self.showImagePicker.toggle()
                    }
                ForEach(images, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                        .cornerRadius(5)
                }
            }
        }.frame(height: 110)
        .sheet(isPresented: $showImagePicker, content: {
            ImagePickerView(sourceType: .photoLibrary, onImagePicked: { image in
                // add selected image to array images
                let newImage = NewImage(imageData: image, imageTitle: "", imageText: "")
                self.imageCollection.images.append(newImage)
            })
        })
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
