//
//  HttpClient.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/22.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation

class HttpClient {
    var DefaultHeaders: [String: String] // Authorization Header とか用
    
    init() {
        DefaultHeaders = [String: String]()
    }
    
    
    
    func SendRequest(request: HTTPRequestMessage, callBack: (HTTPResponseMessage) -> Void) {
        let mergedHeaders = DefaultHeaders.merging(request.Headers) { $1 }
        
        var urlRequest = URLRequest(url: request.Url)
        urlRequest.httpMethod = request.Method.rawValue
        urlRequest.allHTTPHeaderFields = mergedHeaders
        
        if request.Method == .POST {
            urlRequest.httpBody = request.Body
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if error != nil {
                self.handleError(error!)
            } else {
                //TODO: HTTPResponseMessage に変換してからコールバック呼ぶ
            }
        }
        task.resume()
    }

    private func handleError(_ error: Error) {
        //TODO: throw できないので、ここでログとかエラーダイアログ？
        
    }
    
    
    enum HTTPMethods: String {
        case GET
        case POST
    }
    
    class HTTPRequestMessage {
        var Url: URL
        var Queries: [URLQueryItem]
        var Headers: [String: String]
        var Method: HTTPMethods
        var Body: Data
        
        init(url: URL, queries: [URLQueryItem], headers: [String: String], method: HTTPMethods, body: Data) {
            Url = url
            Queries = queries
            Headers = headers
            Method = method
            Body = body
        }
    }
    
    class HTTPResponseMessage {
        var Status: HTTPStatus
        var Headers: [String: String]
        var Body: String
        
        init(status: HTTPStatus, headers: [String: String], body: String) {
            Status = status
            Headers = headers
            Body = body
        }
    }
    
    enum HTTPStatuses: String {
        case OK
        case NotAcceptable
        case NotFound
        case InternalServerError
        case Unexpected
    }
    
    class HTTPStatus {
        var StatusCode: String
        var Status: HTTPStatuses
        
        init(code: String) {
            StatusCode = code
            
            switch code {
                case "200":
                    Status = .OK
                case "206":
                    Status = .NotAcceptable
                case "404":
                    Status = .NotFound
                case "500":
                    Status = .InternalServerError
                default:
                    Status = .Unexpected
            }
        }
    }
}



