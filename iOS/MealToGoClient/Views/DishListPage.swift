//
//  DishListPage.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/01.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct DishListPage: View {
    var restaurant: RestaurantDetail
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                Image(restaurant.Images[1].URL)
                    .resizable()
                    .frame(height: 250)
                RestaurantDetailControl(restaurant: restaurant)
                    .padding(.leading, 5.0)
            }
            //ScrollViewで囲ったからListじゃなくてもいいのかも
            List(restaurant.Dishes) { dish in
                DishItemControl(dish: dish)
            }
        }
        .padding(0)
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct DishListPage_Previews: PreviewProvider {
    static var previews: some View {
        DishListPage(restaurant: demoRestaurants[0])
    }
}
