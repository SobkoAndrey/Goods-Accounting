//
//  ViewController.swift
//  Goods Accounting
//
//  Created by Andrey Sobko on 21.09.16.
//  Copyright © 2016 Andrey Sobko. All rights reserved.
//

import UIKit

class GoodsTableViewController: UITableViewController {
    
    var goods = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: ProductCell.cellReuseIdentifier)
        tableView.allowsSelection = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.cellReuseIdentifier, for: indexPath) as! ProductCell
        
        let product = goods[indexPath.row]
        
        cell.nameLabel.text = product.name
        cell.priceLabel.text = String(describing: product.price)
        cell.typeLabel.text = product.type
        
        cell.totalLabel.text = §("Total: ") + String(describing: product.totalCount)
        cell.inStockLabel.text = §("In stock: ") + String(describing: product.inStock)
        
        let sold = (product.totalCount as! Decimal) - (product.inStock as! Decimal)
        let titleForButton = §("Sold: ") + String(describing: sold)
        cell.sellButton.setTitle(titleForButton, for: .normal)
        
        if product.image != nil {
            cell.productPhoto.image = UIImage(data: product.image!)
        } else {
            cell.productPhoto.image = UIImage(named: "no_image")
        }
        
        return cell
    }

}
