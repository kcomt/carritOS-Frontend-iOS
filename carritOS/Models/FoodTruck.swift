//
//  FoodTruck.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 6/22/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class FoodTruck : Codable
{
    var id: Int = 1
    var name: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var buisnessOwnerId: BuisnessOwner
    
    @objc var title: String?
    @objc var subtitle: String?
    @objc var coordinate: CLLocationCoordinate2D{
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}
