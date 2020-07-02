//
//  NotelistView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct NotelistView: View {
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            FriendListScroll()
            
            SearchBar()
            
            NoteTimeline()
        }.environment(\.managedObjectContext, self.context)
    }
}

struct NotelistView_Previews: PreviewProvider {
    static var previews: some View {
        NotelistView()
    }
}
