//
//  FacesView.swift
//  Detect
//
//  Created by Esraa on 5/10/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

struct TagedFace {
    var name: String?
    var image: UIImage?
}

class FacesView: UIViewController {

    let arrayOfPersonsName = ["ahmed", "mohmad", "esraa", "loba", "asmaa"]
    let arrayOfPersonsImage = [#imageLiteral(resourceName: "ic_back_button"), #imageLiteral(resourceName: "ic_back_button"), #imageLiteral(resourceName: "ic_back_button"), #imageLiteral(resourceName: "ic_back_button"), #imageLiteral(resourceName: "ic_back_button")]
    var tagedFaces = [TagedFace]()
    var choicenImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        for index in 0..<arrayOfPersonsName.count {
            tagedFaces.append(TagedFace(name: arrayOfPersonsName[index], image: arrayOfPersonsImage[index]))
        }
    }

    func openImage(_ indexPath: IndexPath) {
        choicenImage = tagedFaces[indexPath.row].image ?? #imageLiteral(resourceName: "ic_image_place-holder")
        self.performSegue(withIdentifier: "ToTageImage", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToTageImage" {
            if let vc = segue.destination as? TagView {
                vc.tagedPic = TagedFace(name: "", image: choicenImage)
            }
        }
    }
    
    @IBAction func backIsPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension FacesView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagedFaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FaceCell", for: indexPath) as? FaceCell {
            cell.configure(tagedFaces[indexPath.row].image ?? #imageLiteral(resourceName: "ic_image_place-holder"), tagedFaces[indexPath.row].name ?? "")
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openImage(indexPath)
    }
}
