//
//  detailViewController.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 6/29/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import UIKit
import MapKit
class detailViewController: UIViewController
{

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    var selectedFoodTruck: FoodTruck?

    override func viewDidLoad() {
        super.viewDidLoad()
        firstView.alpha = 1
        secondView.alpha = 0
        self.navigationItem.title=selectedFoodTruck?.name

    }
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            firstView.alpha = 1
            secondView.alpha = 0
        }
        if sender.selectedSegmentIndex == 1 {
            firstView.alpha = 0
            secondView.alpha = 1
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedMap" {
            if let childVC = segue.destination as? mapController {
                //Some property on ChildVC that needs to be set
                childVC.selectedFoodTruck = selectedFoodTruck
            }
        }
        if segue.identifier == "embedTable" {
            if let childVC2 = segue.destination as? reviewTableController {
                //Some property on ChildVC that needs to be set
                childVC2.selectedFoodTruck = selectedFoodTruck
            }
        }
        if segue.identifier == "showAddReview" {
            if let nextVC = segue.destination as? addReviewController {
                nextVC.selectedFoodTruck = selectedFoodTruck
            }
        }
    }
    
    @IBAction func call(_ sender: UIBarButtonItem) {
        guard let textphoneLabel = selectedFoodTruck?.phoneNumber else {return}
        guard let number = URL(string: "tel://" + textphoneLabel) else { return }
        UIApplication.shared.open(number)
    }
    
    func addReview(){
        if API.instance.isAuthenticated == false{
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "showLogin", sender: self)
            }
        }
        if API.instance.isAuthenticated == true {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "showAddReview", sender: self)
            }
        }
    }
    
    
}
