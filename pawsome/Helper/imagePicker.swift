//
//  ImagePicker.swift
//  B2B
//
//  Created by ekbana on 3/25/21.
//

import UIKit

open class ImagePicker: NSObject {

    private let pickerController: UIImagePickerController
    private weak var presentationController: UIViewController?
    var completion: ((UIImage) -> ())?

    public init(presentationController: UIViewController) {
        self.pickerController = UIImagePickerController()

        super.init()

        self.presentationController = presentationController
    
        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
        self.pickerController.mediaTypes = ["public.image"]
    }
    
    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }
        
        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
            self.presentationController?.presentFullScreen(self.pickerController, animated: true)
        }
    }
    
    public func present(from sourceView: UIView, removeAction: (()->())? = nil) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: UIDevice.current.userInterfaceIdiom == .pad ? .alert : .actionSheet)
        
        if let action = self.action(for: .camera, title: "Take a Photo") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .savedPhotosAlbum, title: "Camera Roll") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .photoLibrary, title: "Library") {
            alertController.addAction(action)
        }
        
        if let removeAction = removeAction {
            let remove = UIAlertAction(title: "Remove Photo", style: .default) { (_) in
                removeAction()
            }
            alertController.addAction(remove)
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.popoverPresentationController?.sourceView = sourceView
            alertController.popoverPresentationController?.sourceRect = sourceView.bounds
            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
        }

        self.presentationController?.present(alertController, animated: true)
    }

}

extension ImagePicker: UIImagePickerControllerDelegate {
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        completion?(image)
    }
    
}

extension ImagePicker: UINavigationControllerDelegate {
    
}
