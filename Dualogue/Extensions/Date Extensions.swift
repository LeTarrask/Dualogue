//
//  Date Extensions.swift
//  Dualogue
//
//  Created by Alex Luna on 11/03/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import Foundation

extension Date {
    func toString(dateFormat format: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        //        dateFormatter.dateStyle = .full
        return dateFormatter.string(from: self)
    }
}
