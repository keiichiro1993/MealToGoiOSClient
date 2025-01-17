//
//  AppGlobalVariables.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/16.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation
import Stripe

class AppGlobalVariables {
    static var SignInClient: SocialSignInClient = SocialSignInClient()
    static var Token: String = ""
    static var OrderCart: Order = Order(restaurantId: "")
    static var JwtToken: TokenResponse?
    static var StripeCustomerContext: STPCustomerContext?
}
