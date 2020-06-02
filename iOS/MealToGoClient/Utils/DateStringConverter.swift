//
//  DateStringConverter.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/02.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class DateStringConverter {
    class func ToDate(string: String, format: String) -> Date {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.date(from: string)!
    }

    class func ToString(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
