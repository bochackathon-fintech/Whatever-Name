//
//  MainViewController.swift
//  DonationGO2
//
//  Created by Christos Chadjikyriacou on 10/06/2017.
//  Copyright © 2017 Christos Chadjikyriacou. All rights reserved.
//

import UIKit



class MainViewController: UIViewController {

    
    static var loaded = false
    
    
    @IBOutlet weak var rewardsLabel: UILabel!
    @IBOutlet weak var antamiviLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var rocketView: RocketView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        rocketView.value = 200
        
        if MainViewController.loaded {
            rewardsLabel.text = 11.description
            antamiviLabel.text = 15.description
            totalLabel.text = 34.description + "€"
        }
        else {
            MainViewController.loaded = true
            incrementLabel(string: "€", label: totalLabel, to: 34)
            incrementLabel(string: "", label: antamiviLabel, to: 15)
            incrementLabel(string: "", label: rewardsLabel, to: 11)
        }

        
        
    }
    
    func incrementLabel(string:String,label:UILabel,to endValue: Int) {
        let duration: Double = 2.0 //seconds
        DispatchQueue.global().async {
            for i in 0 ..< (endValue + 1) {
                let sleepTime = UInt32(duration/Double(endValue) * 1000000.0)
                usleep(sleepTime)
                DispatchQueue.main.async {
                    label.text = "\(i)" + string
                }
            }
        }
    }
  

}
