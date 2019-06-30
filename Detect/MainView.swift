//
//  ViewController.swift
//  Detect
//
//  Created by Esraa on 5/8/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

class MainView: UIViewController {

    var choicenImage: UIImage!

    @IBAction func galleryIsPressed(_ sender: UIButton) {
        ImagePickerHelper.shared.openGallery(vc: self)
        ImagePickerHelper.shared.pickedImageBlock = { (image) in
            self.choicenImage = image
            self.performSegue(withIdentifier: "ToTageImage", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToTageImage" {
            if let vc = segue.destination as? TagView {
                vc.tagedPic = TagedFace(name: "", image: choicenImage.toData())
            }
        }
    }
}

