//
//  Dish.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/05/31.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class Dish: Codable, Identifiable {
    var id: UUID
    
    var DishName: String
    var DishDescription: String
    var PrimaryImageUrl: String
    var IsPublished: Bool
    var Images: [ImageWithData]
    var OrderOptions: [OrderOption]
    
    init(dishName: String, dishDescription: String, isPublished: Bool, images: [ImageWithData]) {
        self.DishName = dishName
        self.DishDescription = dishDescription
        self.IsPublished = isPublished
        self.Images = images
        
        PrimaryImageUrl = images.first!.URL
        id = UUID()
        OrderOptions = [OrderOption(name: "Size", options: ["Large", "Medium", "Small"], defaultValue: "Medium", isUIList: false), OrderOption(name: "Drink", options: ["Melon Soda", "Coke", "Sparkling Water", "Oolong tea"], defaultValue: "Oolong tea", isUIList: true)]
    }
}

class OrderOption: Codable, Identifiable {
    var OptionName: String
    var OptionList: [String]
    var DefaultValue: String
    var IsUIList: Bool
    var id: String
    
    init(name: String, options: [String], defaultValue: String, isUIList: Bool) {
        self.OptionName = name
        self.OptionList = options
        self.DefaultValue = defaultValue
        self.IsUIList = isUIList
        
        id = UUID().uuidString
    }
}
