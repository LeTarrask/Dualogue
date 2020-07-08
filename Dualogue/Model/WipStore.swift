//
//  WipStorage.swift
//  Dualogue
//
//  Created by Alex Luna on 08/07/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import Foundation
import UIKit

// Mark: - Temporary Storage for Information Before Saving on Core Data
class WipNote {
    var title: String
    var text: String
    var contacts: [WipContact]
    var images: [WipImage]
    
    init(title: String, text: String, contacts: [WipContact], images: [WipImage]) {
        self.title = title
        self.text = text
        self.contacts = contacts
        self.images = images
    }
}

class WipContact {
    var contactName: String
    var contactImageName: String?
    var contactImage: UIImage?
    
    init(contactName: String, contactImageName: String?, contactImage: UIImage?){
        self.contactName = contactName
        self.contactImageName = contactImageName
        self.contactImage = contactImage
    }
}

class WipImage {
    var imageData: UIImage
    var imageTitle: String?
    var imageText: String?
    
    init(imageData: UIImage, imageTitle: String?, imageText: String?) {
        self.imageData = imageData
        self.imageTitle = imageTitle
        self.imageText = imageText
    }
}
