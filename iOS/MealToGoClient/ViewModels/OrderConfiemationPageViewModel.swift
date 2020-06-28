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
}
