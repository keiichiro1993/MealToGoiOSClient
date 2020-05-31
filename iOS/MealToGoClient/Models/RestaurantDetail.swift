//
//  RestaurantDetail.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/05/31.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class RestaurantDetail {
    var Name: String
    var Dishes: [Dish]
    var Description: String
    var Messages: [Message]
    var OpenTime: Date
    var CloseTime: Date
    var Images: [ImageWithData]
    
    init(name: String, description: String) {
        self.Description = description
        self.Name = name
        
        Dishes = []
        Messages = []
        OpenTime = Date()
        CloseTime = Date()
        Images = []
    }
}
