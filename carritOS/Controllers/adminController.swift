//
//  adminController.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 7/8/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import UIKit

class adminController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstView.alpha = 1
        secondView.alpha = 0
        thirdView.alpha = 0
    }
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            firstView.alpha = 1
            secondView.alpha = 0
            thirdView.alpha = 0
        }
        if sender.selectedSegmentIndex == 1 {
            firstView.alpha = 0
            secondView.alpha = 1
            thirdView.alpha = 0
        }
        
        if sender.selectedSegmentIndex == 2 {
            firstView.alpha = 0
            secondView.alpha = 0
            thirdView.alpha = 1
        }
    }
}
