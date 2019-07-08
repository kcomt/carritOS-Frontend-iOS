//
//  foodTruckAdminController.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 7/8/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import UIKit

class foodTruckAdminController: UIViewController{
    
    var foodTrucks: [FoodTruck] = [FoodTruck]()
    var id: String = ""
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadFoodtrucks()
    {
        API.getFoodTrucksByOwnerId(name: String(API.instance.buisnessOwner!.id)){ list in
            self.foodTrucks = list
            print(self.foodTrucks[0].name)
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadFoodtrucks()
    }
}

extension foodTruckAdminController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodTrucks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodTruckCell2", for: indexPath) as! foodTruckCell2
        // Configure the cell
        cell.update(from: foodTrucks[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let foodTruck = foodTrucks[indexPath.row]
        
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
}
