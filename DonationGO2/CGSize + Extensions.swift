//
//  CGSize + Extensions.swift
//  TemplateProject
//
//  Created by Christos Hadjikyriacos on 10/02/2017.
//  Copyright © 2017 Cocoon Creations. All rights reserved.
//

import UIKit

extension CGSize {
    func descreaseBy(times:Int) -> CGSize{
        return CGSize(width: width / CGFloat(times) , height: height /  CGFloat(times))
    }
}
