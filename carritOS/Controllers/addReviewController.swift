//
//  addReviewController.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 7/8/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import UIKit

class addReviewController: UIViewController {
    
    @IBOutlet weak var textField: UITextView!
     var selectedFoodTruck: FoodTruck?
    
    var review: Review = Review()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveReview(_ sender: Any) {
        review.consumerId = API.instance.consumer!
        review.foodTruckId = selectedFoodTruck!
        review.comment = textField.text
        
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: Date()) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MMM-yyyy"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        
        review.date = myStringafd
        review.qualification = 10
        
        API.saveReview(review: review)
    }
    

}
