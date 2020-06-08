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
    
    let sizeList = ["Large","Medium","Small"]
    var body: some View {
        Form {
            HStack {
                Text("Size")
                Spacer()
                Picker(selection: self.$selected, label: Text("Size")) {
                    ForEach(self.sizeList, id: \.self) { size in
                        Text(size)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            HStack {
                Text("Amount")
                Spacer()
                HStack {
                    Button(action: {}) { Text("-") }
                        .onTapGesture {
                            if self.amount > 1 {
                                self.amount = self.amount - 1
                            }
                    }
                    TextField("Amount", value: self.$amount, formatter: NumberFormatter())
                        .frame(width: 50)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                    Button(action: {}) { Text("+") }
                        .onTapGesture {
                            self.amount = self.amount + 1
                    }
                }
                Spacer()
            }
        }
    }
}

struct OrderItemOptionsControl_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemOptionsControl()
    }
}
