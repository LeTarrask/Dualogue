//
//  ContactsView.swift
//  Dualogue
//
//  Created by Alex Luna on 17/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

// TODO:
// ADD EMPTY CELL IN THE BEGINNING
// ADD CONTACTS CELLS FROM MODEL

struct ContactsView: View {
    var body: some View {
        // TO DO: ADD SEARCH IN THE TOP
        
        // TO DO: HOW TO ADD 2 ROWS OF CELLS AND SEVERAL LINES???
        
        VStack {
            ZStack {
                Rectangle().fill(Color.accent2)
                    .frame(width: 165, height: 195, alignment: .topLeading)
                    .cornerRadius(20)
                Image("plussign")
                    .frame(width: 40, height: 40)
            }
            ZStack {
                Rectangle().fill(Color.accent1)
                    .frame(width: 165, height: 195, alignment: .topLeading)
                    .cornerRadius(20)
                VStack {
                    AvatarView(image: "face2", size: 100, name: "Jennifer Longmamenne")
                        .foregroundColor(Color.main)
                        .padding()
                    Button(action: {print("button pressed")}, label: {
                        Text("CREATE NOTE")
                            .padding(5)
                            .background(Color.accent3)
                            .foregroundColor(Color.main)
                            .font(.body)
                            .cornerRadius(10)
                    })
                }.frame(width: 165, height: 195)
            }
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
