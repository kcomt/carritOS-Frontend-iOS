//
//  reviewAdminController.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 7/8/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import UIKit

class saleAdminController: UIViewController{
    
    var sales: [Sale] = [Sale]()
    var id: String = ""
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadSales()
    {

    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadSales()
    }
}

extension saleAdminController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sales.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "saleCell", for: indexPath) as! saleCell
        // Configure the cell
        cell.update(from: sales[indexPath.row])
        
        return cell
    }
}

