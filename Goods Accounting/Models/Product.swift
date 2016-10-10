//
//  Product.swift
//  Goods Accounting
//
//  Created by Andrey Sobko on 24.09.16.
//  Copyright © 2016 Andrey Sobko. All rights reserved.
//

import Foundation
import CoreData


class Product: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var type: String
    @NSManaged var price: NSNumber
    @NSManaged var image: Data?
    @NSManaged var totalCount: NSNumber
    @NSManaged var inStock: NSNumber
    @NSManaged var sold: NSNumber

}
