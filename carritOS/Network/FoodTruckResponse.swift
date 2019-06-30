//
//  foodTruckResponse.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 6/28/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation

struct foodTruckResponse: Codable {
    var status: String?
    var code: String?
    var message: String?
    var foodTruck: [FoodTruck]?
}
