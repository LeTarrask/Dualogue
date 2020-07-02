//
//  TimelinesView.swift
//  Dualogue
//
//  Created by Alex Luna on 20/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI
import CoreData

struct TimelinesView: View {
    var body: some View {
        VStack {
            FriendListScroll()
            
            NoteTimeline()
        }
    }
}

struct TimelinesView_Previews: PreviewProvider {
    static var previews: some View {
        TimelinesView()
    }
}
