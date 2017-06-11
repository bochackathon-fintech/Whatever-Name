//
//  NearbyViewController.swift
//  DonationGO2
//
//  Created by Christos Chadjikyriacou on 10/06/2017.
//  Copyright © 2017 Christos Chadjikyriacou. All rights reserved.
//

import UIKit
import MapKit

class NearbyViewController: UIViewController {

    
    @IBAction func pay(_ sender: Any) {
        performSegue(withIdentifier: "pay", sender: nil)
    }
    
    
    @IBOutlet weak var bubbleImageView: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
  
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         bubbleImageView.transform = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    @IBAction func showBubble(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
              self.bubbleImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
}
