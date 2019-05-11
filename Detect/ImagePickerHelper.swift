//
//  ImagePickerHelper.swift
//  Detect
//
//  Created by Esraa on 5/10/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation
import UIKit

class ImagePickerHelper: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    static let shared = ImagePickerHelper()
    var pickedImageBlock: ((UIImage) -> Void)?
    fileprivate var currentVC: UIViewController!

    func openGallery(vc: UIViewController) {
        currentVC = vc
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            currentVC.present(myPickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.pickedImageBlock?(image)
            currentVC.dismiss(animated: true, completion: { })
        } else {
            print("some thing went wrong")
            currentVC.dismiss(animated: true, completion: { })
        }
    }
}
