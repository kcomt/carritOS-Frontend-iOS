//
//  detailViewController.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 6/29/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import UIKit
import MapKit
class detailViewController: UIViewController
{

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    var selectedFoodTruck: FoodTruck?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title=selectedFoodTruck?.name
        print(self.selectedFoodTruck?.latitude)
        print(self.selectedFoodTruck?.latitude)
        print(self.selectedFoodTruck?.longitude)
        centerMap(CLLocation(latitude: selectedFoodTruck!.latitude, longitude: selectedFoodTruck!.longitude))
    }
    
    func centerMap( _ location: CLLocation){
        let coordinateRegion = MKCoordinateRegion(center: selectedFoodTruck!.coordinate, latitudinalMeters: 1000,longitudinalMeters: 1000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            firstView.alpha = 1
            secondView.alpha = 0
        }
        if sender.selectedSegmentIndex == 1 {
            firstView.alpha = 0
            secondView.alpha = 1
        }
    }
}
