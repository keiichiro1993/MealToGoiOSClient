//
//  OrderItemViewModel.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/08.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class OrderItem: ObservableObject, Identifiable, Codable {
    var id: String
    var DishItem: Dish
    @Published var OrderOptions: [OrderOptionWithValue]
    @Published var Amount: Int
    
    init(dish: Dish) {
        id = UUID().uuidString
        self.DishItem = dish
        self.OrderOptions = [OrderOptionWithValue]()
        self.Amount = 1
        
        if dish.OrderOptions.count > 0 {
            for option in dish.OrderOptions {
                self.OrderOptions.append(OrderOptionWithValue(option))
            }
        }
    }
    
    ///Conform Codable
    enum CodingKeys: CodingKey {
        case id
        case DishItem
        case OrderOptions
        case Amount
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        DishItem = try container.decode(Dish.self, forKey: .DishItem)
        OrderOptions = try container.decode([OrderOptionWithValue].self, forKey: .OrderOptions)
        Amount = try container.decode(Int.self, forKey: .Amount)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(DishItem, forKey: .DishItem)
        try container.encode(OrderOptions, forKey: .OrderOptions)
        try container.encode(Amount, forKey: .Amount)
    }
}

class OrderOptionWithValue: ObservableObject, Identifiable, Codable {
    var id: String
    @Published var SelectedValue: String
    var OrderOptionItem: OrderOption
    
    //OrderItem からしか呼ばれないので無名引数でOK
    init(_ option: OrderOption) {
        id = option.id
        self.OrderOptionItem = option
        self.SelectedValue = option.DefaultValue
    }
    
    
    ///Conform Codable
    enum CodingKeys: CodingKey {
        case id
        case SelectedValue
        case OrderOptionItem
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        OrderOptionItem = try container.decode(OrderOption.self, forKey: .OrderOptionItem)
        SelectedValue = try container.decode(String.self, forKey: .SelectedValue)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(OrderOptionItem, forKey: .OrderOptionItem)
        try container.encode(SelectedValue, forKey: .SelectedValue)
    }
}
