//
//  Notification + Extensions.swift
//  TemplateProject
//
//  Created by Christos Hadjikyriacos on 10/02/2017.
//  Copyright © 2017 Cocoon Creations. All rights reserved.
//


import UIKit


extension Notification {
    var keyboardHeight:CGFloat {
        return (userInfo![UIKeyboardFrameBeginUserInfoKey]! as AnyObject).cgRectValue.size.height
    }
}
