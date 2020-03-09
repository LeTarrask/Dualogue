//
//  NoteView.swift
//  Dualogue
//
//  Created by Alex Luna on 28/01/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

// TO DO:
// clear these strange white borders

struct NotePreView: View {
    var title: String
    var date: String
    var imagePath: String?
    var text: String?
    @State var completed: Bool = false
    var contactName: String?
    var contactImg: String?
    @State var isExpanded: Bool = false
    
    init(note: NoteStorage) {
        self.title = note.title ?? ""
        self.date = note.date?.toString() ?? ""
        self.imagePath = ""
        self.text = note.text ?? ""
        self.isExpanded = false
        self.completed = note.isCompleted
        self.contactName = "Astolfo"
        self.contactImg = "face"
    }

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
                    AvatarView(image: contactImg ?? "face", size: 60, name: contactName ?? "")
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

//struct NoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotePreView()
//    }
//}
