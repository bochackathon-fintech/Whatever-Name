//
//  InformationsViewController.swift
//  DonationGO2
//
//  Created by Christos Chadjikyriacou on 10/06/2017.
//  Copyright © 2017 Christos Chadjikyriacou. All rights reserved.
//

import UIKit

class InformationsViewController: UIViewController {

    @IBOutlet weak var moneyLabel: UILabel!
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var value:Int = 1 {
        didSet {
            moneyLabel.text = value.description + "€"
        }
    }
    
    @IBAction func minusButtonAction(_ sender: Any) {
        if value > 0 {
            value = value - 1
        }
    }
    
    @IBAction func plusButtonAction(_ sender: Any) {
        value = value + 1
    }
    @IBAction func donateNowButtonAction(_ sender: Any) {
        let url = URL(string: "http://api.bocapi.net/v1/api/banks/bda8eb884efcef7082792d45/accounts/d058aa4367ebd75b4742f57b/make-transaction")
        
        var request = URLRequest(url: url!)
        let session = URLSession.shared
        request.addValue("013e300b93a44aa2847a29b9", forHTTPHeaderField: "Track-ID")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("123456789", forHTTPHeaderField: "Auth-ID")
        request.addValue("01860902840400", forHTTPHeaderField: "Auth-Provider-Name")
        request.addValue("0509706aa54c43768acbb33687d5bef6", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        
        let jsonDict: [String: Any] = ["description": "string",
                                       "challenge_type": "string",
                                   "from": ["account_id":"d058aa4367ebd75b4742f57b",
                                            "bank_id":"bda8eb884efcef7082792d45"],
                                   "to": ["account_id":"5dadbb4247773c3d9d819f7e",
                                            "bank_id":"bda8eb884efcef7082792d45"],
                                   "value": ["currency":"EUR",
                                          "amount":value]]
        
        request.httpBody =  try! JSONSerialization.data(withJSONObject: jsonDict, options: [])
        
        request.httpMethod = "post"

        let task = session.dataTask(with: request) { (data, response, error) in
            print("completed")
            DispatchQueue.main.async {
                MainViewController.antamivi = MainViewController.antamivi + 5
                MainViewController.total = MainViewController.total + 10
                self.performSegue(withIdentifier: "complete", sender: nil)
            }
            if let error = error {
                print("error:", error)
                return
            }
            do {
                guard let data = data else { return }
                guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary else { return }
                print("json:", json)
            } catch {
                print("error:", error)
            }
        }
        
        task.resume()
        
    }
    
    @IBAction func tenbuttonAction(_ sender: Any) {
        value = 10
    }
    @IBAction func fiveButtonAction(_ sender: Any) {
        value = 5
    }
    @IBAction func oneEuroButtonAction(_ sender: Any) {
        value = 1
    }
}
