//
//  UIDevice + Extension.swift
//  MFSNetinfo
//
//  Created by Panayiotis on 17/03/2017.
//  Copyright © 2017 netinfo. All rights reserved.
//

import UIKit


extension UIDevice {
    
    
    class var currentDeviceIdentifier:String {
        
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
        
    }
}
