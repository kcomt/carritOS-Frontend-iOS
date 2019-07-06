//
//  reviewCell.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 7/6/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import UIKit

class reviewCell: UITableViewCell {
    
    var review : Review?
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(from review: Review) {
        self.review = review
        self.commentLabel.text = review.comment
    }
}
