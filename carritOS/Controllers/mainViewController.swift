//
//  mainViewController.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 6/27/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
import UIKit
import os

class mainViewController: UIViewController, UISearchDisplayDelegate, UISearchBarDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var foodTrucks: [FoodTruck] = [FoodTruck]()
    var foodTrucksFiltered: [FoodTruck] = [FoodTruck]()
    var buisnessOwners: [BuisnessOwner] = [BuisnessOwner]()
    var currentRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Regresar", style: .plain, target: nil, action: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
        searchBar.delegate = self
        loadFoodTrucks()
    }
    
    func loadFoodTrucks(){
        API.getFoodTrucks{ list in
            self.foodTrucks = list
            print(self.foodTrucks[0].name)
            self.foodTrucksFiltered = self.foodTrucks
            self.tableView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {foodTrucksFiltered = foodTrucks
            tableView.reloadData()
            return}
        
        foodTrucksFiltered = foodTrucks.filter({foodtruck -> Bool in
            guard let text = searchBar.text else {return false}
            return foodtruck.name.contains(text)
        })
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationViewController = segue.destination as! detailViewController
                destinationViewController.selectedFoodTruck = self.foodTrucks[indexPath.row]
                print(indexPath.row)
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension mainViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return foodTrucksFiltered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodTruckCell", for: indexPath) as! foodTruckCell
        // Configure the cell
            cell.update(from: foodTrucksFiltered[indexPath.row])
      
        return cell
    }
}
