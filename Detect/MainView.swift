//
//  ViewController.swift
//  Detect
//
//  Created by Esraa on 5/8/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

class MainView: UIViewController {

    var pickedImageBlock: ((UIImage) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //        openGallery()
}

extension MainView: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            present(myPickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.pickedImageBlock?(image)
        } else {
            print("some thing went wrong")
        }
        self.dismiss(animated: true, completion: { })
    }
}
//self.performSegue(withIdentifier: "ToTageImage", sender: self)
