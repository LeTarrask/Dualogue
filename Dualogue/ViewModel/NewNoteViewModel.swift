//
//  NewNoteViewModel.swift
//  Dualogue
//
//  Created by Alex Luna on 09/07/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI
import Combine

class ImageCollection: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    var images: [NewImage] {
        didSet { objectWillChange.send() }
    }

    init() {
        self.images = [NewImage]()
    }
    
    func reset() {
        self.images = [NewImage]()
    }
}

struct NewImage {
    var imageData: UIImage
    var imageTitle: String?
    var imageText: String?
}




