//
//  NotelistView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct NotelistView: View {
    @EnvironmentObject var model: FakeModel

    var body: some View {
        VStack {
            FriendListScroll()
            
            SearchBar()
            
            NoteTimeline()
        }
    }
}

struct NotelistView_Previews: PreviewProvider {
    static var previews: some View {
        NotelistView()
            .environmentObject(FakeModel())    }
}
