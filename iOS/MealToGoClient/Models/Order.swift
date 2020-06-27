//
//  Order.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/12.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class Order: ObservableObject, Identifiable, Codable {
    var id: String
    @Published var OrderItems: [OrderItem]
    @Published var OrderComment: String
    @Published var SelectedPaymentMethod: PaymentMethod
    
    init() {
        self.id = UUID().uuidString
        
        self.OrderItems = [OrderItem]()
        self.OrderComment = ""
        
        // とりあえずテストで
        self.SelectedPaymentMethod = PaymentMethod(name: "クレジットカード")
    }
    
    ///Conform Codable
    enum CodingKeys: CodingKey {
        case id
        case OrderItems
        case OrderComment
        case SelectedPaymentMethod
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        OrderItems = try container.decode([OrderItem].self, forKey: .OrderItems)
        OrderComment = try container.decode(String.self, forKey: .OrderComment)
        SelectedPaymentMethod = try container.decode(PaymentMethod.self, forKey: .SelectedPaymentMethod)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(OrderItems, forKey: .OrderItems)
        try container.encode(OrderComment, forKey: .OrderComment)
        try container.encode(SelectedPaymentMethod, forKey: .SelectedPaymentMethod)
    }
}
