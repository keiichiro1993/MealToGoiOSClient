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
    @State var isPresented: Bool = false
    @State var selectedItem: Dish? = nil
    
    var body: some View {
        //ScrollView(.vertical) {
        List {
            VStack(spacing: 0) {
                Image(restaurant.Images[1].URL)
                    .resizable()
                    .frame(height: 250)
                RestaurantDetailControl(restaurant: restaurant)
                    .padding(.leading, 5.0)
            }
            .listRowInsets(EdgeInsets())
            .padding(.bottom, -25)
            //ScrollViewで囲ったからListじゃなくてもいいのかも
            Text("Menu")
            ForEach(restaurant.Dishes) { dish in
                Button(action: {
                    self.isPresented.toggle()
                    self.selectedItem = dish
                }) {
                    DishItemControl(dish: dish)
                }
            }
            .listRowInsets(EdgeInsets())
        }
        .padding(0)
        .navigationBarTitle("", displayMode: .inline)
        .sheet(isPresented: $isPresented) {
            VStack(alignment: .center) {
                HStack(alignment: .top) {
                    Spacer()
                    Button("Cancel") {
                        self.isPresented.toggle()
                    }
                    .padding(10)
                }
                Text("Options")
                OrderItemOptionsControl()
                    .environmentObject(OrderItem(dish: self.selectedItem!))
            }
            Spacer()
            Button(action: {
                self.isPresented.toggle()
            }) {
                Text("Add to Cart")
            }
            .padding(10)
            .padding(.bottom, 5)
        }
    }
}

struct DishListPage_Previews: PreviewProvider {
    static var previews: some View {
        DishListPage(restaurant: demoRestaurants[0])
    }
}
