//
//  UIImage.swift
//  Dualogue
//
//  Created by Alex Luna on 08/07/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
        var pngRepresentationData: Data? {
            return self.pngData()
        }

        var jpegRepresentationData: Data? {
            return self.jpegData(compressionQuality: 1.0)
        }
    }
