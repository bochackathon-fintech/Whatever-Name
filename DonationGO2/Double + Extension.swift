//
//  Double + Extension.swift
//  MFSNetinfo
//
//  Created by Panayiotis on 31/03/2017.
//  Copyright © 2017 netinfo. All rights reserved.
//

import Foundation


extension Double {
    var toDecimal:Decimal {
        return NSNumber(value: self).decimalValue
    }
    
    
    var prettyPrinted:String {
        return String(format: "%.2f", self)
    }
    
    
}
