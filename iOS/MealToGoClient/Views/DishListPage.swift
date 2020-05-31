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
        List {
            RestaurantDetailControl()
            
        }
    }
}

struct DishListPage_Previews: PreviewProvider {
    static var previews: some View {
        DishListPage()
    }
}
