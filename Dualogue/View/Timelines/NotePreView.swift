//
//  NoteView.swift
//  Dualogue
//
//  Created by Alex Luna on 28/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI


// This struct should get a note and display it. Right now it's getting trouble unwrapping the content that comes from NoteTimeline
struct NotePreView: View {
    var title: String
    var date: String
    var imagePath: String?
    var text: String?
    var contactName: String?
    var contactImg: String?

    @State var completed: Bool = false
    @State var isExpanded: Bool = false

    var body: some View {
        VStack {
            HStack {
                Button(action: {self.isExpanded.toggle()}, label: {
                    VStack(alignment: .leading) {
                        Text(date)
                            .foregroundColor(Color.gray)
                            .font(.caption)
                        Text(title)
                            .bold()
                            .foregroundColor(.main)
                            .lineLimit(2)
                    }
                    .padding()
                Spacer()
                })
                
                if contactImg != nil && contactName != nil {
                    // TO DO: add failsafe with image placeholder here as well
                    AvatarView(image: contactImg ?? "face.png", size: 60, name: contactName ?? "")
                        .offset(y: 8)
                        .padding()
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity,  alignment: Alignment.topLeading)
            if isExpanded {
                HStack {
                    // TO DO: Implement carrousel

                    if (imagePath != nil) {
                        Image(imagePath!) // TO DO: add image placeholder
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 200)
                            .cornerRadius(20)
                        .padding()
                    }
                    
                }
                if text != "" {
                    TextDisplay(text: text ?? "")
                }
            }
            Divider()
            .frame(height: 1)
            .background(Color.main)
        }
        .background(Color.mainBG)
    }
}

struct TextDisplay: View {
    var text: String = ""
    
    var body: some View {
        Text(text)
            .font(.body)
            .foregroundColor(Color.main)
            .padding()
    }
}

//struct NotePreView_Previews: PreviewProvider {
//    static var previews: some View {
//        let notestorage = DuaNote(title: "text")
//        NotePreView()
//    }
//}
