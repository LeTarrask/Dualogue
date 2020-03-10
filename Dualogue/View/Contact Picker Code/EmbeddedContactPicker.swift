//
//  EmbeddedContactPicker.swift
//  Dualogue
//
//  Created by Alex Luna on 10/03/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

// MARK- EmbeddedContactPicker
import SwiftUI
import Contacts
import Combine

struct EmbeddedContactPicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = EmbeddedContactPickerViewController

    final class Coordinator: NSObject, EmbeddedContactPickerViewControllerDelegate {
        func embeddedContactPickerViewController(_ viewController: EmbeddedContactPickerViewController, didSelect contact: CNContact) {
            viewController.dismiss(animated: true, completion: nil)
        }

        func embeddedContactPickerViewControllerDidCancel(_ viewController: EmbeddedContactPickerViewController) {
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<EmbeddedContactPicker>) -> EmbeddedContactPicker.UIViewControllerType {
        let result = EmbeddedContactPicker.UIViewControllerType()
        result.delegate = context.coordinator
        return result
    }

    func updateUIViewController(_ uiViewController: EmbeddedContactPicker.UIViewControllerType, context: UIViewControllerRepresentableContext<EmbeddedContactPicker>) { }

}
