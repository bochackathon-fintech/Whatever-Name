//
//  CampainsMapViewController.swift
//  DonationGO2
//
//  Created by Christos Chadjikyriacou on 11/06/2017.
//  Copyright © 2017 Christos Chadjikyriacou. All rights reserved.
//

import UIKit

class CampainsMapViewController: UIViewController {
    
    static var loaded = false
    
    

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var backerLabel: UILabel!
    @IBOutlet weak var daysToGoLabedl: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if CampainsMapViewController.loaded {
            backerLabel.text = 24.description
            daysToGoLabedl.text = 56.description
           
        }
        else {
            CampainsMapViewController.loaded = true
            incrementLabel(string: "", label: backerLabel, to: 24)
            incrementLabel(string: "", label: daysToGoLabedl, to: 56)
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
