//
//  AddProductView.swift
//  Goods Accounting
//
//  Created by Andrey Sobko on 21.09.16.
//  Copyright © 2016 Andrey Sobko. All rights reserved.
//

import UIKit

class AddProductViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView! {
        didSet {
            photoImageView.layer.cornerRadius = photoImageView.bounds.width / 2
        }
    }
    
    @IBOutlet weak var addPhotoButton: UIButton! {
        didSet {
            addPhotoButton.layer.cornerRadius = addPhotoButton.bounds.height / 2
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var countTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
