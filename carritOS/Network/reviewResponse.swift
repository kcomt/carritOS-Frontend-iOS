//
//  reviewResponse.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 7/7/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation

struct reviewResponse: Codable {
    var status: String?
    var code: String?
    var message: String?
    var review: [Review]?
}
