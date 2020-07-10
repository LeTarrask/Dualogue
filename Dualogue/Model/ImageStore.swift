//
//  ImageStore.swift
//  Dualogue
//
//  Created by Alex Luna on 09/03/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import Foundation
import SwiftUI

class ImageStore {
    @Environment(\.managedObjectContext) var moc

    var images: [DuaImage]

    init() {
        self.images = [DuaImage]()
    }

    // MARK: - empties the collection
    func reset() {
        self.images = [DuaImage]()
    }

    // MARK: - stores images & info to DB
    func sendInfoToDB() {
        for image in images {
            // TO DO: Check if image already exists in moc
            let newImage = ImageStorage(context: self.moc)
            newImage.path = image.filename
            newImage.id = image.id
            if image.text != nil {
                newImage.text = image.text
            }
            if image.title != nil {
                newImage.title = image.title
            }

            do {
                try self.moc.save()
                print("Saving new image")
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - loads images & info in model format, but doesn't store permanently
    func collect(image: UIImage, title: String?, text: String?) {
        let path = saveToUserDir(image: image)
        var storageImage = DuaImage(image: String(describing: path))
        if let title = title {
            storageImage.title = title
        }
        if let text = text {
            storageImage.text = text
        }
        images.append(storageImage)
    }

    // MARK: - stores the image file in app memory and returns an image name
    func saveToUserDir(image: UIImage) -> String? {
        let imageName = UUID().uuidString
        if let data = image.pngData() {
            let filename = getDocumentsDirectory().appendingPathComponent(imageName)
            try? data.write(to: filename)
            return imageName
        } else {
            print("Failed storing image to User Directory")
        }
        return nil
    }

    // MARK: - reloads the image file from app memory and returns it
    func loadImage(imageName: String) -> UIImage {
        let filename = getDocumentsDirectory().appendingPathComponent(imageName)

        guard let imageData = try? Data(contentsOf: filename), let image = UIImage(data: imageData) else {
            return UIImage(named: "thom.jpeg")!
        }
        return image
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

extension URL {
    static var documentsDirectory: URL {
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let documentsUrl: URL = URL(fileURLWithPath: documentsDirectory)
        return documentsUrl
    }

    static func urlInDocumentsDirectory(with filename: String) -> URL {
        return documentsDirectory.appendingPathComponent(filename)
    }
}
