//
//  StripeClient.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/08/09.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation
import Stripe

class StripeClient: NSObject, STPCustomerEphemeralKeyProvider {
    let baseURL = URL(string: "https://mtgpayment.azurewebsites.net/api/")!
    
    func createCustomerKey(withAPIVersion apiVersion: String, completion: @escaping STPJSONResponseCompletionBlock) {
        let url = self.baseURL.appendingPathComponent("ephemeral_keys")
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = [URLQueryItem(name: "api_version", value: apiVersion)]
        
        //for test
        let body = "{\"apiVersion\":\"\(apiVersion)\", \"stripeCustomerId\":\"cus_HrzpOm940m9mcc\"}"
        print(body)
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "POST"
        request.httpBody = body.data(using: .utf8)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            print((response as? HTTPURLResponse)!.statusCode)
            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let data = data,
                let json = ((try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]) as [String : Any]??) else {
                    completion(nil, error)
                    return
            }
            
            completion(json, nil)
        })
        task.resume()
    }
    
    func GetPaymentIntent(amount: Int) throws -> JsonPaymentIntent {
        let url = self.baseURL.appendingPathComponent("payment_intent")
        let body = "{\"amount\":\(String(amount)), \"customerId\":\"cus_HrzpOm940m9mcc\"}"
        
        do {
            let client = HttpClient()
            client.DefaultHeaders["Content-Type"] = "application/json"
            let response = try client.PostAsync(url: url, body: body.data(using: .utf8)!)
            NSLog("response: \(response.Body!)")
            
            return try JSONDecoder().decode(JsonPaymentIntent.self, from: response.Body!)
        } catch let error as NSError {
           throw error
        }
    }
}
