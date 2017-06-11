//
//  AchievmentTableViewCell.swift
//  DonationGO2
//
//  Created by Christos Chadjikyriacou on 11/06/2017.
//  Copyright © 2017 Christos Chadjikyriacou. All rights reserved.
//

import UIKit

class AchievmentTableViewCell: UITableViewCell {

    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    var achievment:Achievmnet! {
        didSet {
    
            pointsLabel.text = achievment.points.description + "XP"
            nameLabel.text = achievment.name
        }
    }
    
}


class Achievmnet {
    var points:Int
    var name:String
    var done:Bool
    init(points:Int,name:String,done:Bool) {
        self.points = points
        self.name = name
        self.done = done
    }
    
    
    
    static var first:Achievmnet {
        return Achievmnet(points: 4, name: "Complete 10 donations", done: true)
    }
    
    static var second:Achievmnet {
        return Achievmnet(points: 2, name: "Complete 5 donations in Nicosia", done: false)
    }
    
    static var third:Achievmnet {
        return Achievmnet(points: 4, name: "Donate over 10 euros", done: false)
    }
    
    
    static var all = [Achievmnet.first,Achievmnet.second,Achievmnet.third]
}
