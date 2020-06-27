//
//  MealToGoClient.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/24.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class MealToGoHTTPClient {
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
    
}
