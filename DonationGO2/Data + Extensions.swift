//
//  Data + Extensions.swift
//  MFSNetinfo
//
//  Created by Panayiotis on 30/03/2017.
//  Copyright © 2017 netinfo. All rights reserved.
//

import Foundation


extension Data {
    
    var toString:String? {
        return String.init(data: self, encoding: String.Encoding.utf8)
    }
}
