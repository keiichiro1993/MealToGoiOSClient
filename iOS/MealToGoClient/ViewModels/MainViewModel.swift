//
//  MainViewModel.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/10.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class MainViewModel: ObservableObject {
    enum Pages: String {
        case FindOnList = "Find on List"
        case FindOnMap = "Find on Map"
        case Profile = "Profile"
        case Auth = "Auth"
    }
    
    @Published var SelectedPage: Pages
    @Published var ShowSideMenu: Bool = false
    //@Published var OrderInfo: Order = Order(restaurantId: "")
    
    init () {
        if !AppGlobalVariables.SignInClient.checkIfAuthenticated() {
            SelectedPage = .Auth
        } else {
            SelectedPage = .FindOnList
        }
    }
}
