//
//  Message.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/05/31.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class Message {
    var Body: String
    var Timestamp: Date
    var IsRead: Bool
    
    init(body: String, timestamp: Date, isRead: Bool) {
        self.Body = body
        self.Timestamp = timestamp
        self.IsRead = isRead
    }
}
