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
    
    //TODO: 一覧時に必要な情報と詳細表示時にのみ必要な情報を分けたい
    var Name: String
    var Dishes: [Dish]
    var Description: String
    var Messages: [Message]
    var OpenTime: Date
    var CloseTime: Date
    
    var LogoImage: ImageWithData
    var Images: [ImageWithData] //アイコンのURLも追加した方がいいかも
    var AvailableTimes: [AvailableTime]
    
    var AddressInfo: Address
    var CoordinateInfo: Coordinate
    
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
        self.AddressInfo = Address(postalCode: "000-0000", state: "千葉県", city: "千葉市", address1: "美浜区", address2: "ダミー" )
        self.CoordinateInfo = Coordinate(Latitude: 35.6436578, Longitude: 140.0410532)
        
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

struct Address {
    var PostalCode: String
    var State: String
    var City: String
    var AddressLine1: String
    var AddressLine2: String
    
    init(postalCode: String, state: String, city: String, address1: String, address2: String) {
        self.PostalCode = postalCode
        self.State = state
        self.City = city
        self.AddressLine1 = address1
        self.AddressLine2 = address2
    }
}

struct Coordinate {
    var Latitude: Double
    var Longitude: Double
}
