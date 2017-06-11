//
//  UITableViewCell + Extension.swift
//  TemplateProject
//
//  Created by Christos Hadjikyriacos on 10/02/2017.
//  Copyright © 2017 Cocoon Creations. All rights reserved.
//

import UIKit




extension UITableViewCell {
    
    static var identifier:String {
        return self.objectName
    }
    
    static func create(tableView:UITableView,reuseIdentifier:String? = nil) -> Self {
        return create(tableView: tableView, reuseIdentifier: (reuseIdentifier ?? identifier), type: self)
    }
    
    fileprivate static func create<T : UITableViewCell>(tableView:UITableView,reuseIdentifier:String,type: T.Type) -> T {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? T else {
            let nib = UINib(nibName: reuseIdentifier, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
            return create(tableView: tableView,reuseIdentifier:reuseIdentifier, type: type)
        }
        
        return cell

    }

}
