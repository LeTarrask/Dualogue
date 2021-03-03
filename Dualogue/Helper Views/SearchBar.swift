//
//  SearchBar.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct SearchBar: View {
    @State var searchValue: String = "Search"
    
    var body: some View {
        TextField("Search", text: $searchValue)
            .foregroundColor(.gray)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
            .padding(10)
            
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
