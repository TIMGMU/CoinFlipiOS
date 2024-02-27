//
//  TablesViewController.swift
//  CoinFlip
//
//  Created by Tim Nguyen on 5/7/23.
//  Copyright © 2023 RADEFFFACTORY. All rights reserved.
//
import CoreLocation
import MapKit
import UIKit

class TablesViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var MapView: MKMapView!
    let manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            render(location)
        }
        }
    func render(_ location:CLLocation){
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        MapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        MapView.addAnnotation(pin)
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        // Make the button rounded
        let button = sender as! UIButton
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
    }

}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


