//
//  foodTruckCell.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 6/27/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import UIKit

class foodTruckCell: UITableViewCell {
    
    var foodTruck : FoodTruck?
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(from foodTruck: FoodTruck) {
        self.foodTruck = foodTruck
        self.titleLabel.text = foodTruck.name
    }
}
