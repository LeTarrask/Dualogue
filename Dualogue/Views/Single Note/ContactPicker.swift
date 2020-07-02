//
//  ContactPicker.swift
//  Dualogue
//
//  Created by Alex Luna on 02/07/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI
import ContactsUI

// seguindo isso aqui, quase funciona, mas não mostra o view: https://www.hackingwithswift.com/books/ios-swiftui/using-coordinators-to-manage-swiftui-view-controllers

struct ContactPicker: UIViewControllerRepresentable {
    @Binding var contact: CNContact?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> CNContactPickerViewController {
        let picker = CNContactPickerViewController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: CNContactPickerViewController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    typealias UIViewControllerType = CNContactPickerViewController
    
    class Coordinator: NSObject, CNContactPickerDelegate, UINavigationControllerDelegate {
        var parent: ContactPicker

        init(_ parent: ContactPicker) {
            self.parent = parent
        }
        
        func contactPicker(_ viewController: CNContactPickerViewController, didSelect: [CNContact]) {
            print(parent.contact)
            parent.contact = didSelect.first
        }
        
        func contactPickerDidCancel(_ viewController: CNContactPickerViewController) {
            print("dismissing")
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
