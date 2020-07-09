//
//  ContactSelector.swift
//  Dualogue
//
//  Created by Alex Luna on 09/07/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import Foundation
import Combine

class ContactSelector: ObservableObject {
    @Published var contact: WipContact = WipContact(contactName: "Contact Name", contactImageName: "face", contactImage: nil)

    func reset() {
        self.contact = WipContact(contactName: "Contact Name", contactImageName: "face", contactImage: nil)
    }
}
