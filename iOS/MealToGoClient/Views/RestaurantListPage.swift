//
//  RestaurantListPage.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/05/31.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct RestaurantListPage: View {
    var body: some View {
        ZStack(alignment: .leading) {
            List {
                ForEach(demoRestaurants) { restaurant in
                    NavigationLink(destination: DishListPage(restaurant: restaurant)) {
                        HStack(alignment: .top) {
                            Image(restaurant.LogoImage.URL)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100).clipped()
                                .cornerRadius(5)
                            VStack(alignment: .leading) {
                                Text(restaurant.Name)
                                    .font(.system(size: 20))
                                    .bold()
                                Text(restaurant.Description)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Restaurants", displayMode: .inline)
    }
}

struct RestaurantListPage_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListPage()
    }
}
