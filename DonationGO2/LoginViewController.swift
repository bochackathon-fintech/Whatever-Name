//
//  LoginViewController.swift
//  DonationGO2
//
//  Created by Christos Chadjikyriacou on 10/06/2017.
//  Copyright © 2017 Christos Chadjikyriacou. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func fill(_ sender: Any) {
        
        imageView.image = #imageLiteral(resourceName: "loginScreen")
    }


}
