//
//  AppGlobalSettings.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/17.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class AppGlobalSettings {
    private let userDefaults = UserDefaults.standard
    
    enum AuthMethods: String {
        case Facebook
        case Google
        case None
    }
    var AuthMethod: AuthMethods {
        get {
            if let value = userDefaults.object(forKey: "AuthMethod") {
                return  AuthMethods(rawValue: value as! String)!
            } else {
                return .None
            }
        }
        set {
            userDefaults.set(newValue.rawValue, forKey: "AuthMethod")
        }
    }
}
