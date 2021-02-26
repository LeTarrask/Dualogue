//
//  NotePreview.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//


// THIS FILE IS COMPLETELY BROKEN. WE KEEP THIS HERE JUST FOR REFERENCE

import SwiftUI

// TO DO: fix this super buggy file
struct NotePreview: View {
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
                    AvatarView(contact: Contact(contactName: contactName ?? "", contactImage: contactImg), size: 60)
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
            }
            Divider()
                .frame(height: 1)
                .background(Color.main)
        }
        .background(Color.mainBG)
    }
}

struct NotePreview_Previews: PreviewProvider {
    static var previews: some View {
        NotePreview(title: "teste", date: "234124")
    }
}
