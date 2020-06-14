//
//  PaymentMethod.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/13.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class PaymentMethod: ObservableObject {
    var Name: String
    
    //デバッグ用
    @Published var Fiels: [String] = ["","","",""]
    
    init(name: String) {
        self.Name = name
    }
    
}
