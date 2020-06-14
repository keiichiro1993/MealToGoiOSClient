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
    @Published var ShowSideMenu: Bool = false
    @Published var OrderInfo: Order = Order()
}
