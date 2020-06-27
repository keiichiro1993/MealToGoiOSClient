//
//  ImageWithData.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/05/31.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class ImageWithData: Codable {
    var URL: String
    var Description: String
    var IsPrimary: Bool
    
    init(url: String, description: String, isPrimary: Bool) {
        self.URL = url
        self.Description = description
        self.IsPrimary = isPrimary
    }
}
