//
//  AchievmentViewController.swift
//  DonationGO2
//
//  Created by Christos Chadjikyriacou on 11/06/2017.
//  Copyright © 2017 Christos Chadjikyriacou. All rights reserved.
//

import UIKit

class AchievmentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
  
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Achievmnet.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AchievmentTableViewCell.create(tableView: tableView)
        cell.achievment = Achievmnet.all[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }

}
