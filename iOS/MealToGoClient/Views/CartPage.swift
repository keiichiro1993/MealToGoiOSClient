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
        ZStack {
            VStack {
                List {
                    ForEach(viewModel.OrderInfo.OrderItems) { item in
                        DishItemControl(dish: item.Dish)
                    }
                }
                Spacer()
                NavigationLink(destination: OrderConfirmationPage().environmentObject(viewModel)) {
                    Text("注文に進む")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity,maxHeight: 60)
                }
                .background(UIResources.AppThemeColor)
            }
                //.edgesIgnoringSafeArea(.bottom)
                .navigationBarTitle("カート", displayMode: .inline)
        }
    }
}

struct CartPage_Previews: PreviewProvider {
    static var previews: some View {
        CartPage()
            .environmentObject(MainViewModel())
    }
}
