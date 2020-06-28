//
//  OrderItemOptionsControl.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/08.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct OrderItemOptionsControl: View {
    @State var selected: String = "Medium"//本当はモデルに追加したいけど、とりあえず。
    @State var selectedItem: Dish? = nil
    @State var amount: Int = 1
    
    @EnvironmentObject var orderItem: OrderItem
    
    let sizeList = ["Large","Medium","Small"]
    var body: some View {
        NavigationView {
            Form {
                ForEach(orderItem.OrderOptions.indices) { index in
                    HStack {
                        Text(self.orderItem.OrderOptions[index].OrderOptionItem.OptionName)
                        Spacer()
                        if self.orderItem.OrderOptions[index].OrderOptionItem.IsUIList {
                            Picker(selection: self.$orderItem.OrderOptions[index].SelectedValue, label: Text("")) {
                                ForEach(self.orderItem.OrderOptions[index].OrderOptionItem.OptionList, id: \.self) { item in
                                    Text(item)
                                }
                            }
                        } else {
                            Picker(selection: self.$orderItem.OrderOptions[index].SelectedValue, label: Text("")) {
                                ForEach(self.orderItem.OrderOptions[index].OrderOptionItem.OptionList, id: \.self) { item in
                                    Text(item)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                    }
                }
                HStack {
                    Text("Amount")
                    Spacer()
                    HStack {
                        Button(action: {}) { Text("-") }
                            .onTapGesture {
                                if self.orderItem.Amount > 1 {
                                    self.orderItem.Amount = self.orderItem.Amount - 1
                                }
                        }
                        
                        TextField("Amount", value: self.$orderItem.Amount, formatter: NumberFormatter())
                            .frame(width: 50)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                        Button(action: {}) { Text("+") }
                            .onTapGesture {
                                self.orderItem.Amount = self.orderItem.Amount + 1
                        }
                    }
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct OrderItemOptionsControl_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemOptionsControl()
            .environmentObject(OrderItem(dish: demoRestaurants[0].Dishes.first!))
    }
}
