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
    @Published var UserInfo: UserInfo
    
    init(userInfo: UserInfo) {
        self.OrderItems = [OrderItem]()
        self.OrderComment = ""
        self.UserInfo = userInfo
        
        self.id = UUID()
    }
}
