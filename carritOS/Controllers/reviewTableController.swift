//
//  reviewTableController.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 7/6/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import UIKit
import os

class reviewTableController: UIViewController{
    var reviews: [Review] = [Review]()
    var selectedFoodTruck: FoodTruck?
    var id: String = ""
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedFoodTruck!.name)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadReviews(){
        API.getReviews(id: String(selectedFoodTruck!.id)){ list in
            self.reviews = list
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadReviews()
    }
}

extension reviewTableController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(69)
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as! reviewCell
        // Configure the cell
        cell.update(from: reviews[indexPath.row])
        
        return cell
    }
    
    
}
