//
//  MealToGoClient.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/24.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation
import Stripe

class MtGClient {
    private let urlBase = "http://127.0.0.1:8081"
    private var token: String
    private var client: HttpClient
    
    init(token: String) {
        self.token = token
        client = HttpClient()
        client.DefaultHeaders["Authentication"] = token
    }
    
    func GetRestaurantList(coordinate: Coordinate) throws -> [Restaurant] {
        do {
            let result = try client.GetAsync(url: URL(string: urlBase + "/restaurants")!).Body
            return try JSONDecoder().decode([Restaurant].self, from: result!)
        } catch let error as NSError {
            throw error
        }
    }
    
    func GetRestaurantDetail(id: String) throws -> RestaurantDetail {
        do {
            let result = try client.GetAsync(url: URL(string: urlBase + "/restaurants")!).Body
            return try JSONDecoder().decode(RestaurantDetail.self, from: result!)
        } catch let error as NSError {
            throw error
        }
    }
    
    static func GetJwtToken(idToken: String) throws{
        let postUrl = URL(string: "http://127.0.0.1:8081/users/oauth2")
        let postData = """
            {
            "externalToken" : "\(idToken)",
            "authenticationProvider" : "google"
            }
            """.data(using: .utf8)
        do {
            let client = HttpClient()
            let response = try client.PostAsync(url: postUrl!, body: postData!)
            NSLog("response: \(response.Body!)")
            AppGlobalVariables.JwtToken = try JSONDecoder().decode(TokenResponse.self, from: response.Body!)
            print("token: \(AppGlobalVariables.JwtToken!.jwtToken)")
            
            //Stripe initiallization if MtG auth is successful
            AppGlobalVariables.StripeCustomerContext = STPCustomerContext(keyProvider: StripeClient())
        } catch let error as NSError {
           throw error
        }
    }
    
}
