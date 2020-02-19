//
//  SingleNoteView.swift
//  Dualogue
//
//  Created by Alex Luna on 19/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct SingleNoteView: View {
    @State private var date = Date()
    @State private var title: String = "add a very very very very title"
    @State private var contact: DuaUser?
    @State private var images = [Image]()
    @State var text: String
    @State private var isEditing: Bool = true
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            GeometryReader { geometry in
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                    Text(String(describing: self.date))
                        .font(.caption)
                        .foregroundColor(Color.accent3)
                    Text(self.title)
                        .bold()
                        .font(.title)
                        .lineLimit(2)
                        .foregroundColor(Color.main)
                    }
                .padding()
                    .frame(maxWidth: geometry.size.width*4/5)
                    
                    EmptyAvatar(size: 60)
                        .foregroundColor(Color.accent3)
                        .frame(maxWidth: geometry.size.width*1/5)
                }
                .frame(maxWidth: .infinity, maxHeight: 90)
            }
            ZStack {
                Rectangle().fill(Color.accent1)
                    .cornerRadius(20)
                    .padding()
                    
                VStack(alignment: .leading) {
                    GeometryReader { geometry in
                        Image("plussign")
                            .position(x: geometry.size.width/2, y: geometry.size.height/2)
                        
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("add image title")
                                    .font(.title)
                                    .lineLimit(1)
                                Text("add comment")
                                    .lineLimit(3)
                                
                            }
                            .foregroundColor(Color.main)
                            .position(x: geometry.size.width/2, y: geometry.size.height-80)
                        }
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 350, maxHeight: 700)
            }
            if isEditing {
                TextField("", text: $text)
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: 400, alignment: .topLeading)
                .background(Color.main)
                .foregroundColor(Color.mainBG)
                .cornerRadius(20)
                .padding(20)
            } else {
                Text(text)
                .frame(maxWidth: .infinity, maxHeight: 400, alignment: .topLeading)
                .background(Color.mainBG)
                .foregroundColor(Color.main)
                .padding(35)
            }
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.mainBG)
    }
}

struct SingleNoteView_Previews: PreviewProvider {
    static var previews: some View {
        SingleNoteView(text: "lelelelalala lelelelalala lelelelalala lelelelalalalelelelalalalelelelalala lelelelalala lelelelalala lelelelalala lelelelalala")
    }
}
