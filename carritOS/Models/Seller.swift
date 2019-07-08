//
//  Seller.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 7/8/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

class Seller : Codable
{
    var id: Int = 1
    var name: String = ""
    var password: String = ""
    var username: String = ""
    var buisnessOwnerId: BuisnessOwner = BuisnessOwner()
    var dni: String = ""
}
