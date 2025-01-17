//
//  MealToGoClientTests.swift
//  MealToGoClientTests
//
//  Created by 若狭渓一郎 on 2020/05/31.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import XCTest
@testable import MealToGoClient

class MealToGoClientTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let postUrl = URL(string: "http://127.0.0.1:8081/users/oauth2")
        let postData = """
        {
            "externalToken" : "",
            "authenticationProvider" : "google"
        }
        """.data(using: .utf8)
        do {
            let client = HttpClient()
            //let response = try client.GetAsync(url: URL(string: "https://google.com")!)
            let response = try client.PostAsync(url: postUrl!, body: postData!)
            print(response.ReadResponseAsString())
        } catch let error as NSError {
            print(error.domain)
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
