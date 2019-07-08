//
//  tabBarLogin.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 7/8/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import UIKit

class tabBarLogin: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var usernameTextField2: UITextField!
    @IBOutlet weak var passwordTextField2: UITextField!
    
    @IBOutlet weak var usernameTextField3: UITextField!
    @IBOutlet weak var passwordTextField3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginConsumer(_ sender: UIButton) {
    }
    
    @IBAction func loginBuisnessOwner(_ sender: UIButton) {
    }
    @IBAction func loginSeller(_ sender: UIButton) {
    }
}
