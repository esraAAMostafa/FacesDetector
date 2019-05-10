//
//  FacesView.swift
//  Detect
//
//  Created by Esraa on 5/10/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

struct TagedFace {
    var name: String
    var image: UIImage
}

class FacesView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let arrayOfPersonsName = ["ahmed", "mohmad", "esraa", "loba", "asmaa"]
    let arrayOfPersonsImage = [#imageLiteral(resourceName: "ic_back_button"), #imageLiteral(resourceName: "ic_back_button"), #imageLiteral(resourceName: "ic_back_button"), #imageLiteral(resourceName: "ic_back_button"), #imageLiteral(resourceName: "ic_back_button")]
    var tagedFaces = [TagedFace]()

    override func viewDidLoad() {
        super.viewDidLoad()

        for index in 0..<arrayOfPersonsName.count {
            tagedFaces.append(TagedFace(name: arrayOfPersonsName[index], image: arrayOfPersonsImage[index]))
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagedFaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FaceCell", for: indexPath) as? FaceCell {
            cell.configure(tagedFaces[indexPath.row].image, tagedFaces[indexPath.row].name)
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        // open tagview with image 
    }
    
    @IBAction func backIsPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
