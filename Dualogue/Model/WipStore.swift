//
//  WipStorage.swift
//  Dualogue
//
//  Created by Alex Luna on 08/07/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import Foundation
import UIKit
import CoreData

// Mark: - Temporary Storage for Information Before Saving on Core Data
class WipNote {
    var title: String
    var text: String
    var contacts: [WipContact]?
    var images: [WipImage]?
    
    init(title: String, text: String, contacts: [WipContact]?, images: [WipImage]?) {
        self.title = title
        self.text = text
        self.contacts = contacts
        self.images = images
    }
    
    init(from noteStorage: NoteStorage) {
        self.title = noteStorage.title_ ?? ""
        self.text = noteStorage.text_ ?? ""
        self.contacts = [WipContact]()
        self.images = [WipImage]()
//        if noteStorage.contacts != nil {
//
//        }
//        if noteStorage.images != nil {
//
//        }
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
    
    init?(from contactStorage: ContactStorage) {
        if (contactStorage.contactName_ != nil) {
            self.contactName = contactStorage.contactName_!
        } else { return nil }
        if let name = contactStorage.contactName_ {
            self.contactImageName =  name + ".jpg"
        }
        if let imageData = contactStorage.contactImage_ {
            self.contactImage = UIImage(data: imageData)
        }
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
    
    init?(from imageStorage: ImageStorage) {
        if let imageData = imageStorage.data {
            self.imageData = UIImage(data: imageData)!
        } else { return nil }
        
        if imageStorage.title_ != nil {
            self.imageTitle = imageStorage.title_
        }
        
        if imageStorage.subtitle_ != nil {
            self.imageText = imageStorage.subtitle_
        }
    }
}
