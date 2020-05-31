//
//  RestaurantDetail.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/05/31.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class RestaurantDetail: Identifiable {
    var id: UUID
    
    var Name: String
    var Dishes: [Dish]
    var Description: String
    var Messages: [Message]
    var OpenTime: Date
    var CloseTime: Date
    var Images: [ImageWithData]
    
    init(name: String, description: String, dishes: [Dish], messages: [Message], open: Date, close: Date, images: [ImageWithData]) {
        self.Description = description
        self.Name = name
        self.Dishes = dishes
        self.Messages = messages
        self.OpenTime = open
        self.CloseTime = close
        self.Images = images
        
        id = UUID()
    }
}
