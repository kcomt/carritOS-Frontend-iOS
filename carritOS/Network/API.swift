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

    static let baseUrlString = "https://carritos-backend.herokuapp.com"
    static let foodTrucksUrlString = "\(baseUrlString)/foodTrucks/ordered"
    static let buisnessOwnerUrlString = "\(baseUrlString)/buisnessOwners"
    static let reviewsUrlString = "\(baseUrlString)/reviews/foodTruck/"
    static let loginUrlString = "\(baseUrlString)/authenticate"
    
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
        print(newUrl)
        var list: [Review] = [Review]()
        AF.request(newUrl).responseJSON(completionHandler: {
            response in
            print(response)
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
    
    static func loginConsumer(username: String, password: String){
        let loginRequest = [
            "username" : username,
            "password" : password
        ]
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
                        print(clienJSON)
                        var clientName = clienJSON["sub"]
                        print(clientName)
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
