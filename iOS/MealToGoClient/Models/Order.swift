//
//  Order.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/12.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class Order: ObservableObject, Identifiable {
    var id: String
    var RestaurantId: String
    @Published var OrderItems: [OrderItem]
    @Published var OrderComment: String
    @Published var SelectedPaymentMethod: PaymentMethod
    
    init(restaurantId: String) {
        self.id = UUID().uuidString
        
        self.OrderItems = [OrderItem]()
        self.OrderComment = ""
        self.RestaurantId = restaurantId
        
        // とりあえずテストで
        self.SelectedPaymentMethod = PaymentMethod(name: "クレジットカード")
    }
}
