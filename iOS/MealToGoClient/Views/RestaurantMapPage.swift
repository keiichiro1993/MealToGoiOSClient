//
//  RestaurantMapPage.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/10.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

// [iOS] swift4対応　地図アプリをアプリ上から起動する
// https://qiita.com/cusa/items/1a62e1158a64162dcfa2

// SwiftUIでGoogleMapsを表示するには
// https://kwmt27.net/2019/10/06/how-to-googlemap-on-swiftui/


import SwiftUI

struct RestaurantMapPage: View {
    var body: some View {
        RestaurantMapControl()
            .navigationBarTitle("Restaurants", displayMode: .inline)
    }
}

struct RestaurantMapPage_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantMapPage()
            .edgesIgnoringSafeArea(.bottom)
    }
}


