//
//  sellerController.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 7/8/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import UIKit

class sellerController: UIViewController{
    var id: String = ""
    @IBOutlet weak var totalTextField: UITextField!
    
    @IBOutlet weak var summaryTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        API.instance.logout()
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "logout", sender: self)
        }
    }
}
