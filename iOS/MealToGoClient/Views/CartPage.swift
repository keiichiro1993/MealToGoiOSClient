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
        List(viewModel.cartItems) { item in
            Text(item.Dish.DishName)
        }
    }
}

struct CartPage_Previews: PreviewProvider {
    static var previews: some View {
        CartPage()
    }
}
