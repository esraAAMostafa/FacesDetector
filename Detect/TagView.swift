//
//  TagView.swift
//  Detect
//
//  Created by Esraa on 5/10/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

class TagView: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var image: UIImageView!
    var textField: UITextField!
    
    var tagedPic: TagedFace = TagedFace()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawTagText(100, 100)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        image.image = self.tagedPic.image?.toImage() ?? #imageLiteral(resourceName: "ic_image_place-holder")
        textField.text = self.tagedPic.name ?? ""
    }

    func drawTagText(_ x: Double, _ y: Double) {
        textField = UITextField(frame: CGRect(x: x, y: y, width: 150.00, height: 30.00));
        textField.placeholder = "tag here"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.backgroundColor = #colorLiteral(red: 0.3027814925, green: 0.2675184906, blue: 0.501363039, alpha: 1)
        textField.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField.font = UIFont(name: "HelveticaNeue" , size: 20)
        textField.clearsOnBeginEditing = true
        self.view.addSubview(textField)
    }
    
    @IBAction func saveIsPressed(_ sender: UIButton) {
        // save image & textfield in data source
    }

    @IBAction func backIsPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
