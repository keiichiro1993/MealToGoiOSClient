//
//  JsonOrder.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/28.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class JsonOrder: Codable {
    var id: String?
    var RestaurantId: String
    var OrderItems: [JsonOrderItem]
    var OrderComment: String
    var SelectedPaymentMethod: PaymentMethod
    
}

class JsonOrderItem: Codable {
    var DishId: String
    var OrderOptions: [OrderOptionWithValue]
    var Amount: Int
    
    /*init(_ baseItem: OrderItem) {
        //self.RestaurantId = baseItem.DishItem.
    }*/
}
