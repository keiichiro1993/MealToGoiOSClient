//
//  DishListPage.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/01.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct DishListPage: View {
    var body: some View {
        ScrollView {
            VStack {
                VStack(spacing: 0) {
                    Image(demoRestaurants[0].Images[1].URL)
                        .resizable()
                        .frame(height: 250)
                    RestaurantDetailControl()
                        .padding(.leading, 5.0)
                }
                .padding(0)
                
                //ScrollViewで囲ったからListじゃなくてもいいのかも
                List {
                    
                    Text("test")
                }
            }.navigationBarTitle(demoRestaurants[0].Name)
        }
    }
}

struct DishListPage_Previews: PreviewProvider {
    static var previews: some View {
        DishListPage()
    }
}
