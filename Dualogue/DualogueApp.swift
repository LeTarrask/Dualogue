//
//  DualogueApp.swift
//  Dualogue
//
//  Created by Alex Luna on 29/06/2020.
//

import SwiftUI

@main
struct DualogueApp: App {
    @StateObject var dataController: DataController
    
    var body: some Scene {
        WindowGroup {
            MainTab()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
}
