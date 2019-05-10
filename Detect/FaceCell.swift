//
//  FaceCell.swift
//  Detect
//
//  Created by Esraa on 5/10/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

class FaceCell: UICollectionViewCell {

    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var personName: UILabel!
    
    func configure(_ image: UIImage, _ name: String) {
        self.personImage.image = image
        self.personName.text = name
    }
    
}
