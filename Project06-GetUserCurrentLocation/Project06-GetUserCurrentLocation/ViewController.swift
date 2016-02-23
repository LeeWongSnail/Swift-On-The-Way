//
//  ViewController.swift
//  Project06-GetUserCurrentLocation
//
//  Created by LeeWong on 16/2/23.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var locationMsg: UILabel!
    
    var locationManager : CLLocationManager!
    
    @IBAction func getLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        self.locationMsg.text = error.localizedDescription
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: { (placemark, error) -> Void in
            if(error != nil) {
                self.locationMsg.text = error!.localizedDescription
                return
            }
            
            if placemark!.count > 0 {
                let pm = placemark![0]
                self.showLocationInfo(pm)
            } else {
                self.locationMsg.text = "Error Occurs"
            }
        })

    }
    
    private func showLocationInfo(placemark:CLPlacemark?) {
        if let containsPlacemark = placemark {
            locationManager.stopUpdatingLocation()
            
//            let locality = (containsPlacemark.locality != nil ? containsPlacemark.locality : "")
//            let postalCode = (containsPlacemark.postalCode != nil ? containsPlacemark.postalCode : "")
//            let administrativeArea = (containsPlacemark.administrativeArea != nil ? containsPlacemark.administrativeArea : "")
//            
//            let country = (containsPlacemark.country != nil ? containsPlacemark.country : "")
//            
            let addressDict = (containsPlacemark.addressDictionary != nil ? containsPlacemark.addressDictionary! : Dictionary()) 
            let address = addressDict["Name"]
        
            
            self.locationMsg.text = address as! String
            
        }
    }
}

