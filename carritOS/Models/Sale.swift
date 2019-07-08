//
//  Sale.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 6/22/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation

class Sale : Codable
{
    var id: Int = 1
    var total: Double = 0
    var sellerId: Seller = Seller()
    var summary: String = ""
    var date: String = ""
}
