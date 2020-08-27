//
//  TokenResponse.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/07/03.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class TokenResponse: Codable {
    var user: User
    var jwtToken: String
}

class User: Codable {
    var userId: Int
    var emailAddress: String
    var authenticationProvider: String
}
