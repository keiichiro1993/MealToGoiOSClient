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
    @EnvironmentObject var viewModel: MainViewModel
    @State var isPresented: Bool = false
    @State var orderItem: OrderItem? = nil
    
    var body: some View {
        //ScrollView(.vertical) {
        List {
            VStack(spacing: 0) {
                Image(restaurant.Images[1].URL)
                    .resizable()
                    .frame(height: 200)
                RestaurantDetailControl(restaurant: restaurant)
                    .padding(.leading, 5.0)
            }
            .listRowInsets(EdgeInsets())
            .padding(.bottom, -25)
            //ScrollViewで囲ったからListじゃなくてもいいのかも
            Text("Menu")
            ForEach(restaurant.Dishes) { dish in
                Button(action: {
                    self.orderItem = OrderItem(dish: dish)
                    self.isPresented.toggle()
                }) {
                    DishItemControl(dish: dish)
                }
            }
            .listRowInsets(EdgeInsets())
        }
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
                    .environmentObject(self.orderItem!)
            }
            Spacer()
            Button(action: {
                self.viewModel.cartItems.append(self.orderItem!)
                self.isPresented.toggle()
            }) {
                Text("Add to Cart")
            }
            .padding(10)
            .padding(.bottom, 5)
        }
        .padding(0)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(trailing: (
            NavigationLink(destination: CartPage()) {
                Image(systemName: "cart")
                    .imageScale(.large)
            }
            .padding(.leading, 10)
        ))
    }
}

struct DishListPage_Previews: PreviewProvider {
    static var previews: some View {
        DishListPage(restaurant: demoRestaurants[0])
    }
}
