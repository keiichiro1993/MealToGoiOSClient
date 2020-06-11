//
//  CartPage.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/10.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct CartPage: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.cartItems) { item in
                    DishItemControl(dish: item.Dish)
                }
                
            }
            Spacer()
            Button(action:{}) {
                Text("Order")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity,maxHeight: 60)
            }
            .frame(maxWidth: .infinity)
            //.padding(.bottom, 25)
            .background(UIResources.AppThemeColor)
        }
        //.edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle("Cart", displayMode: .inline)
    }
}

struct CartPage_Previews: PreviewProvider {
    static var previews: some View {
        CartPage()
            .environmentObject(MainViewModel())
    }
}
