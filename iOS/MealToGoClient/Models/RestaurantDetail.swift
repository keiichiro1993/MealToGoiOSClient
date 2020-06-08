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
    
    var LogoImage: ImageWithData
    var Images: [ImageWithData] //アイコンのURLも追加した方がいいかも
    var AvailableTimes: [AvailableTime]
    
    init(name: String, description: String, dishes: [Dish], messages: [Message], open: Date, close: Date, images: [ImageWithData], logo: ImageWithData) {
        self.Description = description
        self.Name = name
        self.Dishes = dishes
        self.Messages = messages
        self.OpenTime = open
        self.CloseTime = close
        self.Images = images
        self.LogoImage = logo
        
        //一旦テストのために以下で実装
        self.AvailableTimes = [AvailableTime(open,close), AvailableTime(open,close), AvailableTime(open,close), AvailableTime(open,close), AvailableTime(open,close)]
        
        id = UUID()
    }
}

struct AvailableTime: Identifiable {
    var Begin: Date
    var End: Date
    
    var id = UUID()
    
    init(_ begin: Date, _ end: Date) {
        self.Begin = begin
        self.End = end
    }
}
