//
//  LocalizationHelper.swift
//  Goods Accounting
//
//  Created by Andrey Sobko on 13.10.16.
//  Copyright © 2016 Andrey Sobko. All rights reserved.
//

import Foundation

prefix operator §

prefix func §(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}
