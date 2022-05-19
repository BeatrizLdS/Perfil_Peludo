//
//  ImagePicker.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 18/05/22.
//

import Foundation
import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image : UIImage
    @Binding var changeImage : Bool
    @Environment(\.presentationMode) private var presentationMode
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) ->
    UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
         
        var parent: ImagePicker
         
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
            
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.image = image
    
            }
        
            parent.presentationMode.wrappedValue.dismiss()
            parent.changeImage = true
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    
}
