//
//  OrderConfiemationPageViewModel.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/28.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class OrderConfirmationPageViewModel: ObservableObject {
    @Published var OrderCart: Order = AppGlobalVariables.OrderCart
    @Published var paymentContextDelegate = PaymentContextDelegate()
    @Published var totalPrice = 0
    
    init() {
        for order in AppGlobalVariables.OrderCart.OrderItems {
            totalPrice += order.DishItem.Price
        }
        paymentContextDelegate.InitPaymentContext(amount: totalPrice)
    }
}
