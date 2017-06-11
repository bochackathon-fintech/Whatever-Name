//
//  UIApplication + Extensions.swift
//  MFSNetinfo
//
//  Created by Panayiotis on 15/03/2017.
//  Copyright © 2017 netinfo. All rights reserved.
//

import UIKit

extension UIApplication {
    
    var topWindow:UIWindow? {
        return UIApplication.shared.windows.sorted(by: {$0.windowLevel < $1.windowLevel}).first
    }

    
}
