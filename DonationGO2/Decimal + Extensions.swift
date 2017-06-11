//
//  Decimal + Extensions.swift
//  MFSNetinfo
//
//  Created by Panayiotis on 31/03/2017.
//  Copyright © 2017 netinfo. All rights reserved.
//

import Foundation


extension Decimal {
    var toDouble:Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
