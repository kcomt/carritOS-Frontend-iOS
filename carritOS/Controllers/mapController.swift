//
//  mapController.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 6/30/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class mapController: UIViewController {
    
    var selectedFoodTruck: FoodTruck?
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.addAnnotation(selectedFoodTruck!)
        centerMap(CLLocation(latitude: selectedFoodTruck!.latitude, longitude: selectedFoodTruck!.longitude))
    }
    
    func centerMap( _ location: CLLocation){
        let coordinateRegion = MKCoordinateRegion(center: selectedFoodTruck!.coordinate, latitudinalMeters: 1000,longitudinalMeters: 1000)
        
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    

}
