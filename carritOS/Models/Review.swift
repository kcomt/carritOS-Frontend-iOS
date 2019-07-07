//
//  Review.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 6/22/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation

class Review : Codable
{
    var id: Int = 1
    var comment: String = ""
    var qualification: Int = 0
    var consumerId: Consumer
    var foodTruckId: FoodTruck
    var date: String = ""
}
