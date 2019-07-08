//
//  foodTruckAdminController.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 7/8/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import UIKit

class sellerAdminController: UIViewController{
    
    var sellers: [Seller] = [Seller]()
    var id: String = ""
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadSellers()
    {

    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadSellers()
    }
}

extension sellerAdminController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sellers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sellerCell", for: indexPath) as! sellerCell
        // Configure the cell
        cell.update(from: sellers[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let seller = sellers[indexPath.row]
        
        let editAction = UITableViewRowAction(style: .default, title: "Edit"){
            (action, indexPath) in
            
        }
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete"){
            (action, indexPath) in
            
        }
        
        deleteAction.backgroundColor = .red
        editAction.backgroundColor = .yellow
        
        return [deleteAction, editAction]
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        API.instance.logout()
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "logout", sender: self)
        }
    }
}
