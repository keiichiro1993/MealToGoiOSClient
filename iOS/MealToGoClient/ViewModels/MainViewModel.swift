//
//  MainViewModel.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/10.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var SelectedPage: String = "Find on List"
    @Published var showSideMenu: Bool = false
    @Published var cartItems: [OrderItem] = [OrderItem]()
}
