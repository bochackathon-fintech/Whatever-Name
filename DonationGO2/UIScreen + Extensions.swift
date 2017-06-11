//
//  UIScreen + Extensions.swift
//  TemplateProject
//
//  Created by Christos Hadjikyriacos on 10/02/2017.
//  Copyright © 2017 Cocoon Creations. All rights reserved.
//

import Foundation

import UIKit

enum SizeType {
    case unknown
    case iPhone4
    case iPhone5
    case iPhone6
    case iPhone6Plus
}


extension UIScreen {
    
    class var sizeType: SizeType {
        
        if UIScreen.main.bounds.height == 480 {
            return .iPhone4
        }
        else if UIScreen.main.bounds.height == 568 {
            return .iPhone5
        }
        else if UIScreen.main.bounds.height == 667 {
            return .iPhone6
        }
        else if UIScreen.main.bounds.height == 736 {
            return .iPhone6Plus
        }
        else {
            return .unknown
        }
        
    }
}
