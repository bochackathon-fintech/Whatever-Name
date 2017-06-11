//
//  NSObject + Extensions.swift
//  TemplateProject
//
//  Created by Christos Hadjikyriacos on 10/02/2017.
//  Copyright © 2017 Cocoon Creations. All rights reserved.
//

import Foundation

extension NSObject {
    class var objectName: String {
        return NSStringFromClass(self).components(separatedBy: ".").objectAt(index: 1) ?? ""
    }
}
