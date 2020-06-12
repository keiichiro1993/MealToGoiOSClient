//
//  UserInfo.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/12.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class UserInfo: ObservableObject {
    @Published var UserName: String
    @Published var UserId: String
    
    init(_ userName: String, _ userId: String) {
        self.UserName = userName
        self.UserId = userId
    }
}
