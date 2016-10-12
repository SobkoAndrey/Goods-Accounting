//
//  ProductCell.swift
//  Goods Accounting
//
//  Created by Andrey Sobko on 21.09.16.
//  Copyright © 2016 Andrey Sobko. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    static let cellReuseIdentifier = "ProductCell"
    
    @IBOutlet weak var productPhoto: UIImageView! {
        didSet {
            productPhoto.layoutIfNeeded()
            productPhoto.layer.cornerRadius = productPhoto.bounds.width / 2
            productPhoto.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var sellButton: UIButton! {
        didSet {
            sellButton.layoutIfNeeded()
            sellButton.layer.cornerRadius = sellButton.bounds.height / 3
            sellButton.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var inStockLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
}
