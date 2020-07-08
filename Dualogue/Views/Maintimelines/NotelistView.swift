//
//  NotelistView.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

struct NotelistView: View {
    var body: some View {
        VStack {
            FriendListScroll()
            
            NoteTimeline()
        }
    }
}


