//
//  DishItemControl.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/04.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct DishItemControl: View {
    var dish: Dish
    var body: some View {
        HStack {
            Image(dish.PrimaryImageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
            Text(dish.DishName)
        }
    }
}

struct DishItemControl_Previews: PreviewProvider {
    static var previews: some View {
        DishItemControl(dish: demoRestaurants[0].Dishes.first!)
    }
}
