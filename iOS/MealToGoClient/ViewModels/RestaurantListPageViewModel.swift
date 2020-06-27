//
//  RestaurantListPageViewModel.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/27.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class RestaurantListPageViewModel: ObservableObject {
    @Published var Restaurants: [Restaurant]?
    
    init() {
        let client = MtGClient(token: AppGlobalVariables.Token)
        do {
            self.Restaurants = try client.GetRestaurantList(coordinate: Coordinate(Latitude: 0, Longitude: 0))
        } catch let error as NSError {
            AlertUtil.ShowErrorAlert(error: error)
        }
    }
}
