//
//  CampainsAndCausesViewController.swift
//  DonationGO2
//
//  Created by Christos Chadjikyriacou on 10/06/2017.
//  Copyright © 2017 Christos Chadjikyriacou. All rights reserved.
//

import UIKit

class CampainsAndCausesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tapBar: TapBar!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
        }
    }
    
    var selected:ObjectType = .campain {
        didSet {
            tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tapBar.addAction(action: TapBarAction(text: "Campains", image: nil, action: { (_) in
            self.selected = .campain
        }))
        
        tapBar.addAction(action: TapBarAction(text: "Causes", image: nil, action: { (_) in
            self.selected = .cause
        }))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selected {
        case .campain:
            return Object.allCampains.count
        case .cause:
            return Object.allCause.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCell.create(tableView: tableView)
        switch selected {
        case .campain:
            cell.object = Object.allCampains[indexPath.row]
        case .cause:
            cell.object = Object.allCause[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch selected {
        case .cause:
            performSegue(withIdentifier: "mpukka", sender: nil)
        case .campain:
            performSegue(withIdentifier: "map", sender: nil)
        }
 
    }

}


enum ObjectType {
    case campain
    case cause
}

class Object {
    
    var name:String
    var points:Int
    var image:UIImage
    var type:ObjectType
    
    init(name:String,points:Int,image:UIImage,type:ObjectType) {
        self.name = name
        self.points = points
        self.image = image
        self.type = type
    }
    
    
    static var redcross:Object {
        return Object.init(name: "Red Cross", points: 3, image: #imageLiteral(resourceName: "redcross"), type: .cause)
    }
    
    static var antikarkinikos:Object {
        return Object.init(name: "Antikarkinikos", points: 3, image: #imageLiteral(resourceName: "antikarikinikos"), type: .cause)
    }
    
    static var radiomarathonios:Object {
        return Object.init(name: "Telethon", points: 3, image: #imageLiteral(resourceName: "telethon"), type: .campain)
    }
    
    static var poreia:Object {
        return Object.init(name: "Poreia Christodoulas", points: 4, image: #imageLiteral(resourceName: "poreia"), type: .campain)
    }
    
    static var europadona:Object {
        return Object.init(name: "Europa Dona", points: 4, image: #imageLiteral(resourceName: "europaDona"), type: .cause)
    }
    
    static var unisef:Object {
        return Object.init(name: "Unisef", points: 4, image: #imageLiteral(resourceName: "unisef"), type: .cause)
    }
    
    static var allCampains = [Object.poreia,Object.radiomarathonios]
    static var allCause = [Object.redcross,Object.antikarkinikos,Object.europadona,Object.unisef]
    
    
}
