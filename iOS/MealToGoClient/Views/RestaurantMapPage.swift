//
//  RestaurantMapPage.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/10.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct RestaurantMapPage: View {
    var body: some View {
        RestaurantMapControl()
            .navigationBarTitle("Restaurants", displayMode: .inline)
    }
}

struct RestaurantMapPage_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantMapPage()
            .edgesIgnoringSafeArea(.bottom)
    }
}
