//
//  MapUtil.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/13.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

// [iOS] swift4対応　地図アプリをアプリ上から起動する
// https://qiita.com/cusa/items/1a62e1158a64162dcfa2

import Foundation
import UIKit

class MapUtil {
    class func OpenMap(coordinate: Coordinate) {
        let urlString: String!
        if UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!) {
            urlString = "comgooglemaps://?daddr=\(coordinate.Latitude),\(coordinate.Longitude)&directionsmode=walking&zoom=14"
        }
        else {
            urlString = "http://maps.apple.com/?daddr=\(coordinate.Latitude),\(coordinate.Longitude)&dirflg=w"
        }
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}
