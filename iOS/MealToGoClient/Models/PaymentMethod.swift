//
//  PaymentMethod.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/13.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class PaymentMethod: Codable, ObservableObject {
    var Name: String
    //デバッグ用
    @Published var Fields: [String]
    
    init(name: String) {
        self.Name = name
        self.Fields = ["","","",""]
    }
    
    ///Conform Codable
    enum CodingKeys: CodingKey {
        case Fields
        case Name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        Name = try container.decode(String.self, forKey: .Name)
        Fields = try container.decode([String].self, forKey: .Fields)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Name, forKey: .Name)
        try container.encode(Fields, forKey: .Fields)
    }
}
