//
//  DishListPageViewModel.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/27.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class DishListPageViewModel: ObservableObject {
    @Published var RestaurantDetail: RestaurantDetail?
    @Published var Restaurant: Restaurant
    
    init(restaurant: Restaurant) {
        self.Restaurant = restaurant
        
        let client = MtGClient(token: AppGlobalVariables.Token)
        do {
            self.RestaurantDetail = try client.GetRestaurantDetail(id: restaurant.id)
        } catch let error as NSError {
            AlertUtil.ShowErrorAlert(error: error)
        }
    }
}
