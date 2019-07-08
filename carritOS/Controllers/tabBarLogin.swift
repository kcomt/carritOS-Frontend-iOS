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
        API.loginConsumer(username: usernameTextField.text!, password: passwordTextField.text!){ logeado in
            if logeado == true{
                    _ = self.navigationController?.popViewController(animated: true)
                    self.showAlert(with: "Exito", message: "Se Inicio sesión de forma exitosa")
            }
            else{
                OperationQueue.main.addOperation {
                    self.showAlert(with: "Error", message: "Credenciales Incorrectos")
                }
            }
        }
    }
    
    @IBAction func loginBuisnessOwner(_ sender: UIButton) {
        API.loginBuisnessOwner(username: usernameTextField2.text!, password: passwordTextField2.text!){ logeado in
            if logeado == true{
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "showAdmin", sender: self)
                }
            }
            else{
                OperationQueue.main.addOperation {
                    self.showAlert(with: "Error", message: "Credenciales Incorrectos")
                }
            }
        }
    }
    
    @IBAction func loginSeller(_ sender: UIButton) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func showAlert(with title: String?, message: String?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
