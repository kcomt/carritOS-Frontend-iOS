//
//  loginConsumerController.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 7/7/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import UIKit
class loginConsumerController: UIViewController{
 
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextFIeld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: UIButton) {
        API.login(username: usernameTextField.text!, password: passwordTextFIeld.text!)
        print(API.instance.token)
        var x = API.instance.decodeJWTPart(API.instance.token)
        print(x)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
