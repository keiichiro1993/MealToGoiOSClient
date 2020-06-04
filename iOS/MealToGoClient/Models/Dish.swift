//
//  Dish.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/05/31.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class Dish: Identifiable {
    var id: UUID
    
    var DishName: String
    var DishDescription: String
    var PrimaryImageUrl: String
    var IsPublished: Bool
    var Images: [ImageWithData]
    
    init(dishName: String, dishDescription: String, isPublished: Bool, images: [ImageWithData]) {
        self.DishName = dishName
        self.DishDescription = dishDescription
        self.IsPublished = isPublished
        self.Images = images
        
        PrimaryImageUrl = images.first!.URL
        id = UUID()
    }
}
