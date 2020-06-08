//
//  OrderItemViewModel.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/08.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class OrderItem: ObservableObject, Identifiable {
    var id: UUID
    var Dish: Dish
    @Published var OrderOptions: [OrderOptionViewModel]
    @Published var Amount: Int
    
    init(dish: Dish) {
        id = UUID()
        self.Dish = dish
        self.OrderOptions = [OrderOptionViewModel]()
        self.Amount = 1
        
        if dish.OrderOptions.count > 0 {
            for option in dish.OrderOptions {
                self.OrderOptions.append(OrderOptionViewModel(option))
            }
        }
    }
}

class OrderOptionViewModel: ObservableObject, Identifiable {
    var id: UUID
    @Published var SelectedValue: String
    var OrderOption: OrderOption
    
    //OrderItem からしか呼ばれないので無名引数でOK
    init(_ option: OrderOption) {
        id = UUID()
        self.OrderOption = option
        self.SelectedValue = option.DefaultValue
    }
}
