//
//  UserInfo.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/12.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class UserInfo: ObservableObject {
    @Published var MtGUserName: String
    
    @Published var UserId: String // For client-side use only!
    @Published var IdToken: String // Safe to send to the server
    @Published var FullName: String
    @Published var GivenName: String
    @Published var FamilyName: String
    @Published var Email: String
    
    init(_ userName: String, _ userId: String) {
        UserId = userId
        FullName = userName
        MtGUserName = userName
        
        IdToken = ""
        GivenName = ""
        FamilyName = ""
        Email = ""
    }
}
