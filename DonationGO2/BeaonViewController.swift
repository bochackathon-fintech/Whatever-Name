//
//  BeaonViewController.swift
//  DonationGO2
//
//  Created by Christos Chadjikyriacou on 11/06/2017.
//  Copyright © 2017 Christos Chadjikyriacou. All rights reserved.
//

import UIKit
import CoreBluetooth

class BeaonViewController: UIViewController {

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var imageView: UIImageView!{
        didSet {
            imageView.animationDuration = 1.78
            imageView.animationImages = [#imageLiteral(resourceName: "beacon1"),#imageLiteral(resourceName: "beacon2"),#imageLiteral(resourceName: "beacon3"),#imageLiteral(resourceName: "beacon2")]
            imageView.startAnimating()
        }
    }

    var centralManager: CBCentralManager?
    var peripherals = Array<CBPeripheral>()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialise CoreBluetooth Central Manager
        centralManager = CBCentralManager(delegate: self, queue: DispatchQueue.main)
        centralManager?.delegate = self

    }
    
}

extension BeaonViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
   
        if (central.state == .poweredOn){
   
            self.centralManager?.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey:true])
        }
        else {
            // do something like alert the user that ble is not on
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.readRSSI()
        peripheral.delegate = self
        peripheral.discoverServices(nil)

    }
    
  
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
   
        
        
        let rssi = (RSSI as? Int) ?? 0

        if peripheral.name == "gem-2713872" && rssi > -45{
            central.stopScan()
            performSegue(withIdentifier: "payBeacon", sender: nil)

        }
    }
    

}

extension BeaonViewController:CBPeripheralDelegate {
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        print(peripheral.services?.first?.uuid)
    }
}

extension BeaonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        let peripheral = peripherals[indexPath.row]
        cell.textLabel?.text = peripheral.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peripherals.count
    }
}
