//
//  Order.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/12.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class Order: ObservableObject, Identifiable {
    var id: UUID
    @Published var OrderItems: [OrderItem]
    @Published var OrderComment: String
    @Published var SelectedPaymentMethod: PaymentMethod
    
    init() {
        self.id = UUID()
        
        self.OrderItems = [OrderItem]()
        self.OrderComment = ""
        
        // とりあえずテストで
        self.SelectedPaymentMethod = PaymentMethod(name: "クレジットカード")
    }
}
