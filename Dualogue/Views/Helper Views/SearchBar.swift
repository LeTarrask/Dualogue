//
//  SearchBar.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct SearchBar: View {
    @Binding var filterTerm: String

    var body: some View {
        TextField("Search", text: $filterTerm)
            .foregroundColor(.gray)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
            .padding(10)

    }
}
