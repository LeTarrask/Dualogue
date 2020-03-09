//
//  SingleContactView.swift
//  Dualogue
//
//  Created by Alex Luna on 17/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

// TO DO:
//ADD HEADER
//ADD SEARCH
//ADD NOTE LIST FILTERED BY CONTACT
// to do this properly, it would be better if it's already storing contact properly, which is not implemented yet

struct SingleContactView: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    AvatarView(image: "face", size: 100, name: "Jennifer Longname")
                    
                    VStack {
                        Text("20")
                        Text("NOTES")
                    }
                }
                .padding()
                .foregroundColor(Color.main)

                Button(action: {print("button pressed")}, label: {
                    Text("CREATE NOTE")
                        .padding()
                        .background(Color.accent1)
                        .foregroundColor(Color.main)
                        .font(.callout)
                        .cornerRadius(50)
                })
                // TO DO: Insert search field
            }
            
            NoteTimeline()
        }
        .background(Color.mainBG.edgesIgnoringSafeArea(.all))
    }
}

struct SingleContactView_Previews: PreviewProvider {
    static var previews: some View {
        SingleContactView()
    }
}
