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
    static let instance = API()
    
    var isAuthenticated: Bool = false
    var token: String = ""
    
    var consumerId: Int?
    var buisnessOwnerId: Int?
    var sellerId: Int?
    var consumer: Consumer?
    
    static let baseUrlString = "https://carritos-backend.herokuapp.com"
    
    static let foodTrucksUrlString = "\(baseUrlString)/foodTrucks/safe/ordered"
    static let reviewsUrlString = "\(baseUrlString)/reviews/safe/foodTruck/"
    
    static let consumerByUsernameUrlString = "\(baseUrlString)/consumers/safe/username/"
    static let loginUrlString = "\(baseUrlString)/authenticate"
    static let postReviewUrlString = "\(baseUrlString)/reviews/"
    
    static func getFoodTrucks(result:@escaping (_ list:[FoodTruck]) -> Void){
        var list: [FoodTruck]  = [FoodTruck]()
        AF.request(foodTrucksUrlString).responseJSON(completionHandler: {
            response in
            switch response.result {
            case .success( _):
                do {
                    let decoder = JSONDecoder()
                    if let data = response.data {
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
    
    static func getReviews(id: String, result:@escaping (_ list:[Review]) -> Void){
        let newUrl: String = reviewsUrlString + id
        var list: [Review] = [Review]()
        AF.request(newUrl).responseJSON(completionHandler: {
            response in
            switch response.result {
            case .success( _):
                do {
                    let decoder = JSONDecoder()
                    if let data = response.data {
                        let gitData = try decoder.decode([Review].self, from: data)
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
    
    static func getConsumerByUserName(id: String, result:@escaping (_ consumer:Consumer) -> Void){
        let newUrl: String = consumerByUsernameUrlString + id
        var consumer: Consumer  = Consumer()
        AF.request(newUrl).responseJSON(completionHandler: {
            response in
            switch response.result {
            case .success( _):
                do {
                    let decoder = JSONDecoder()
                    if let data = response.data {
                        let gitData = try decoder.decode(Consumer.self, from: data)
                        consumer = gitData
                        result(consumer)
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        })
        
    }
    
    static func saveReview(review: Review)
    {
        let reviewPost = [
            "comment": review.comment,
            "qualification": review.qualification,
            "consumerId": [
                "id": review.consumerId.id,
                "email": review.consumerId.email,
                "name": review.consumerId.name,
                "password": review.consumerId.password,
                "username": review.consumerId.username
            ],
            "foodTruckId": [
                "id": review.foodTruckId.id,
                "name": review.foodTruckId.name,
                "latitude": review.foodTruckId.latitude,
                "longitude": review.foodTruckId.longitude,
                "buisnessOwnerId": [
                    "id": review.foodTruckId.buisnessOwnerId.id,
                    "buisnessName": review.foodTruckId.buisnessOwnerId.buisnessName,
                    "dni": review.foodTruckId.buisnessOwnerId.dni,
                    "email": review.foodTruckId.buisnessOwnerId.email,
                    "lastName": review.foodTruckId.buisnessOwnerId.lastName,
                    "name": review.foodTruckId.buisnessOwnerId.name,
                    "password": review.foodTruckId.buisnessOwnerId.password,
                    "rating": review.foodTruckId.buisnessOwnerId.rating,
                    "username": review.foodTruckId.buisnessOwnerId.username
                ],
                "phoneNumber": review.foodTruckId.phoneNumber
            ],
            "date": review.date
            ] as [String : Any]
        
        print(API.instance.token)
        var Bearer = "Bearer " + API.instance.token
        let headers: HTTPHeaders = [
            "Authorization": Bearer
        ]
        
        AF.request(postReviewUrlString, method: .post, parameters: reviewPost, encoding: JSONEncoding.default, headers: headers).responseJSON
    }
    
    static func loginConsumer(username: String, password: String){
        let loginRequest = [
            "username" : username,
            "password" : password
        ]
        var consumerLog: Consumer = Consumer()
        AF.request(loginUrlString, method: .post, parameters: loginRequest, encoding: JSONEncoding.default).responseJSON(completionHandler:{
            response in
            switch response.result{
            case .success( _):
                do {
                    let decoder = JSONDecoder()
                    if let data = response.data {
                        let gitData = try decoder.decode(Token.self, from: data)
                        API.instance.token = gitData.token
                        API.instance.isAuthenticated = true
                        var clienJSON = API.instance.decode(jwtToken: API.instance.token)
                        let clientName = clienJSON["sub"]
                        API.getConsumerByUserName(id: clientName as! String){ consumer in
                           consumerLog = consumer
                            API.instance.consumerId = consumerLog.id
                            API.instance.buisnessOwnerId = nil
                            API.instance.sellerId = nil
                            API.instance.consumer = consumer
                        }
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func decode(jwtToken jwt: String) -> [String: Any] {
        let segments = jwt.components(separatedBy: ".")
        return decodeJWTPart(segments[1]) ?? [:]
    }
    
    func base64UrlDecode(_ value: String) -> Data? {
        var base64 = value
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        
        let length = Double(base64.lengthOfBytes(using: String.Encoding.utf8))
        let requiredLength = 4 * ceil(length / 4.0)
        let paddingLength = requiredLength - length
        if paddingLength > 0 {
            let padding = "".padding(toLength: Int(paddingLength), withPad: "=", startingAt: 0)
            base64 = base64 + padding
        }
        return Data(base64Encoded: base64, options: .ignoreUnknownCharacters)
    }
    
    func decodeJWTPart(_ value: String) -> [String: Any]? {
        guard let bodyData = base64UrlDecode(value),
            let json = try? JSONSerialization.jsonObject(with: bodyData, options: []), let payload = json as? [String: Any] else {
                return nil
        }
        
        return payload
    }
}
