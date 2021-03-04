//
//  ContactsView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct ContactsView: View {
    var body: some View {
        VStack() {
            SearchBar()
            
            ContactsGrid()
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}

