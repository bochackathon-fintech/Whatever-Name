//
//  TableViewCell.swift
//  DonationGO2
//
//  Created by Christos Chadjikyriacou on 10/06/2017.
//  Copyright © 2017 Christos Chadjikyriacou. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pontisLabel: UILabel!
    
    var object:Object! {
        didSet {
            logoImageView.image = object.image
            nameLabel.text = object.name
            pontisLabel.text = object.points.description + " Points"
        }
    }
    
    
    static let height:CGFloat =  68
}
