//
//  Date Extensions.swift
//  Dualogue
//
//  Created by Alex Luna on 11/03/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import Foundation

extension Date {
    func toString() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        return dateFormatter.string(from: self)
    }
}
