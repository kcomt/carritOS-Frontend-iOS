//
//  API.swift
//  carritOS
//
//  Created by Maurilio Greggio Trujillo on 6/28/19.
//  Copyright © 2019 KcomtAlosilla. All rights reserved.
//

import Foundation
import Alamofire
import os

import Foundation
 class API
 {
    static let baseUrlString = "https://carritos-backend.herokuapp.com"
    static let foodTrucksUrlString = "\(baseUrlString)/foodTrucks/ordered"
    static let buisnessOwnerUrlString = "\(baseUrlString)/buisnessOwners"
    
    static func getFoodTrucks(result:@escaping (_ list:[FoodTruck]) -> Void){
        var list: [FoodTruck]  = [FoodTruck]()
        AF.request(foodTrucksUrlString).responseJSON(completionHandler: {
            response in
            switch response.result {
            case .success( _):
                do {
                    let decoder = JSONDecoder()
                    if let data = response.data {
                        print(response)
                        let gitData = try decoder.decode([FoodTruck].self, from: data)
                        print(gitData[0].name)
                        print(gitData[0].latitude)
                        list = gitData
                        result(list)
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        })

    }
    
    static func getReviews(){
        
    }
    
}
