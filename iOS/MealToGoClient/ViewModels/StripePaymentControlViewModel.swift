//
//  StripePaymentControlViewModel.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/08/24.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation
import Stripe
import SwiftUI

class PaymentContextDelegate: NSObject, STPPaymentContextDelegate, ObservableObject {
    
    @Published var paymentMethodButtonTitle = "Select Payment Method"
    @Published var showAlert = false
    @Published var message = ""
    var paymentContext:STPPaymentContext?
    
    func InitPaymentContext(amount: Int) {
        let config = STPPaymentConfiguration.shared()
        config.shippingType = .shipping
        config.requiredBillingAddressFields = .name
        
        config.requiredShippingAddressFields = .none
        config.companyName = "Testing"
        self.paymentContext = STPPaymentContext(customerContext: AppGlobalVariables.StripeCustomerContext!, configuration: config, theme: .default())
        self.paymentContext!.delegate = self
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        
        self.paymentContext!.hostViewController = keyWindow?.rootViewController
        self.paymentContext!.paymentAmount = amount
    }
    
    func RequestPayment() {
        self.paymentContext!.requestPayment()
    }
    
    func paymentContext(_ paymentContext: STPPaymentContext, didFinishWith status: STPPaymentStatus, error: Error?) {
        //   let title: String
        var message: String
        
        switch status {
        case .success:
            
            //    title = "Success!"
            message = "Thank you for your purchase."
            NSLog("Payment succeeded!")
            showAlert = true
            self.message = message
        case .error:
            
            //   title = "Error"
            message = error?.localizedDescription ?? ""
            showAlert = true
            self.message = message
            NSLog("payment failed...")
            print("error:" + message)
        case .userCancellation:
            return
        @unknown default:
            fatalError("Something really bad happened....")
        }
    }
    
    
    
    func paymentContextDidChange(_ paymentContext: STPPaymentContext) {
        
        paymentMethodButtonTitle = paymentContext.selectedPaymentOption?.label ?? "Select Payment Method"
        
        //updating the selected shipping method
        
        
        //            shippingMethodButtonTitle = paymentContext.selectedShippingMethod?.label ?? "Select Shipping Method"
        //
    }
    
    func paymentContext(_ paymentContext: STPPaymentContext, didUpdateShippingAddress address: STPAddress, completion: @escaping STPShippingMethodsCompletionBlock) {
        
    }
    
    func paymentContext(_ paymentContext: STPPaymentContext, didFailToLoadWithError error: Error) {
        
    }
    
    func paymentContext(_ paymentContext: STPPaymentContext, didCreatePaymentResult paymentResult: STPPaymentResult, completion: @escaping STPPaymentStatusBlock) {
        
        let paymentAmount = paymentContext.paymentAmount
        
        print("TOTAL: \(paymentAmount)")
        
        let client = StripeClient()
        do {
            print("start requesting payment intent with amount: " + String(paymentAmount))
            let intent = try client.GetPaymentIntent(amount: paymentAmount)
            let paymentIntentParams = STPPaymentIntentParams(clientSecret: intent.clientSecret)
            paymentIntentParams.paymentMethodId = paymentResult.paymentMethod?.stripeId
            paymentIntentParams.paymentMethodParams = paymentResult.paymentMethodParams
            
            STPPaymentHandler.shared().confirmPayment(withParams: paymentIntentParams, authenticationContext: paymentContext) { status, paymentIntent, error in
                switch status {
                case .succeeded:
                    // Your backend asynchronously fulfills the customer's order, e.g. via webhook
                    print("SUCCESS!")
                    
                    completion(.success, nil)
                case .failed:
                    completion(.error, error) // Report error
                case .canceled:
                    completion(.userCancellation, nil) // Customer cancelled
                @unknown default:
                    completion(.error, nil)
                }
            }
        } catch let error as NSError {
            completion(.error, error) // Report error
            AlertUtil.ShowErrorAlert(error: error)
        }
    }
    
    
}

struct PaymentContextDelegate_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
