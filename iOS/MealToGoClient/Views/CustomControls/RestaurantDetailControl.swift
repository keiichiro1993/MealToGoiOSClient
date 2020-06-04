//
//  RestaurantDetailControl.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/01.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct RestaurantDetailControl: View {
    var restaurant: RestaurantDetail
    var body: some View {
        HStack(alignment: .top, spacing: 5) {
            Image(restaurant.Images.first!.URL)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(12)
                .border(Color.white, width: 3)
                .cornerRadius(5)
                .offset(y: -20)
            
            VStack(alignment: .leading) {
                Text(restaurant.Name)
                    .font(.headline)
                HStack(spacing: 0) {
                    Text("営業時間: ")
                    Text(DateStringConverter.ToString(date: restaurant.OpenTime, format: "HH:mm"))
                    Text("~")
                    Text(DateStringConverter.ToString(date: restaurant.CloseTime, format: "HH:mm"))
                }
                HStack(spacing: 0) {
                    Text("受付時間: ")
                    ScrollView(.horizontal, content: {
                        HStack(spacing: 5) {
                            ForEach(restaurant.AvailableTimes) { time in
                                HStack(spacing: 0) {
                                    Text(DateStringConverter.ToString(date: time.Begin, format: "HH:mm"))
                                    Text("~")
                                    Text(DateStringConverter.ToString(date: time.End, format: "HH:mm"))
                                }
                            }
                        }
                    })
                }
            }
            .font(.footnote)
            Spacer()
        }
    }
}

struct RestaurantDetailControl_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailControl(restaurant: demoRestaurants[0])
    }
}
