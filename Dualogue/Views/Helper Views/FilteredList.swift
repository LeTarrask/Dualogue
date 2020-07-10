//
//  FilteredList.swift
//  Dualogue
//
//  Created by Alex Luna on 10/07/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @Environment(\.managedObjectContext) var context

    var fetchRequest: FetchRequest<T>

    var results: FetchedResults<T> { fetchRequest.wrappedValue }

    let content: (T) -> Content

    var body: some View {
        ScrollView {
            ForEach(fetchRequest.wrappedValue, id: \.self) { note in
                self.content(note)
            }.onDelete(perform: deleteEntity) // TO DO: - Fix the deletion part
        }
    }

    init(predicate: NSPredicate, @ViewBuilder content: @escaping (T) -> Content) {
            fetchRequest = FetchRequest<T>(entity: T.entity(),
                                           sortDescriptors: [],
                                           predicate: predicate)
            self.content = content
    }

    func deleteEntity(at offsets: IndexSet) {
        for offset in offsets {
            print(fetchRequest.wrappedValue[offset])
            // find this note in our fetch request
            let note = fetchRequest.wrappedValue[offset]

            // delete it from the context
            context.delete(note) // TO DO: test: should delete all the related images
            print(note)
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}
