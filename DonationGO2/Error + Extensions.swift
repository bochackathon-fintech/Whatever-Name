//
//  Error + Extensions.swift
//  MFSNetinfo
//
//  Created by Panayiotis on 25/04/2017.
//  Copyright © 2017 netinfo. All rights reserved.
//

import Foundation


extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}
