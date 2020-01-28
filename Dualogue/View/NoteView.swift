//
//  NoteView.swift
//  Dualogue
//
//  Created by Alex Luna on 28/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct NoteView: View {
    var title: String
    var date: String
    var imagePath: String?
    var text: String?
    @State var completed: Bool = false
    var contactName: String?
    var contactImg: String?
    
    var body: some View {
        VStack {
            HStack {
                if contactImg != nil {
                    // TO DO: add failsafe with image placeholder here as well
                    AvatarView(image: contactImg!, size: 36, name: contactName ?? "")
                    .offset(y: 8)
                }
                VStack(alignment: .leading) {
                    Text(title)
                        .bold()
                    Text(date)
                        .foregroundColor(Color.gray)
                }
                
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity,  alignment: Alignment.topLeading)
            Text("long large headline that shold be big and large and etclong large headline that shold be big and large and etclong large headline that shold be big and large and etclong large headline that shold be big and large and etclong large headline that shold be big and large and etclong large headline that shold be big and large and etclong large headline that shold be big and large and etclong large headline that shold be big and large and etclong large headline that shold be big and large and etc")
                .lineLimit(6)
                .foregroundColor(Color.gray)
                .padding()
            if (imagePath != nil) {
                Image(imagePath!) // TO DO: add image placeholder
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 200)
            }
            HStack {
                Button(action: {self.completed.toggle()}) {
                    if !completed {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(Color.green)
                            .font(.headline)
                        Text("Mark as Incomplete")
                        } else {
                        Image(systemName: "checkmark.seal")
                        Text("Completed")
                        }
                    }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "pencil.circle")
                        .font(.headline)
                    Text("Edit")
                }
            }
            .padding()
            .font(.caption)
            .foregroundColor(Color.gray)
        }
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(title: "The greatest headline for a note ", date: "September 21, 1981", imagePath: "face", contactImg: "face2")
    }
}
