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
    
    // 基本的にはユーザーは GetAsync/PostAsync/SendAsync のみを利用するべき (っていうかたぶんその他は必要ないだろう)
    func GetAsync(url: URL, queries: [URLQueryItem]? = nil, headers: [String: String]? = nil) throws -> HTTPResponseMessage {
        let requestMessage = HTTPRequestMessage(url: url, queries: queries ?? [URLQueryItem](), headers: headers ?? [String: String](), method: .GET, body: nil)
        
        do {
            return try SendRequestAsync(requestMessage)
        } catch let error as NSError {
            throw error
        }
    }
    
    func PostAsync(url: URL, body: Data, queries: [URLQueryItem]? = nil, headers: [String: String]? = nil) throws -> HTTPResponseMessage {
        let requestMessage = HTTPRequestMessage(url: url, queries: queries ?? [URLQueryItem](), headers: headers ?? [String: String](), method: .POST, body: body)
        
        do {
            return try SendRequestAsync(requestMessage)
        } catch let error as NSError {
            throw error
        }
    }
    
    func SendRequestAsync(_ request: HTTPRequestMessage) throws -> HTTPResponseMessage {
        let responseMessage = sendRequestInternal(request)
        
        // エラーハンドル
        if !responseMessage.IsSuccessfulStatus() {
            if let error = responseMessage.Error {
                NSLog(error.localizedDescription)
                throw error
            } else {
                let message = "response status code:\(responseMessage.Status?.StatusCode ?? "none")"
                NSLog(message)
                throw NSError(domain: "NonSuccessfulHTTPResponseError", code: 0, userInfo: ["message" : message])
            }
        }
        
        return responseMessage
    }
    
    private func sendRequestInternal(_ request: HTTPRequestMessage) -> HTTPResponseMessage {
        var responseMessage = HTTPResponseMessage()
        let condition = NSCondition()
        
        let mergedHeaders = DefaultHeaders.merging(request.Headers) { $1 }
        
        var urlRequest = URLRequest(url: request.Url)
        urlRequest.httpMethod = request.Method.rawValue
        urlRequest.allHTTPHeaderFields = mergedHeaders
        
        if request.Method == .POST {
            urlRequest.httpBody = request.Body
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                //変換
                var headers: [String: String] = [:]
                for (key, value) in response.allHeaderFields.enumerated() {
                    headers[key.description] = String(describing: value)
                }
                responseMessage = HTTPResponseMessage(status: HTTPResponseStatus(String(response.statusCode)), headers: headers, body: data)
            }
            
            if let error = error {
                responseMessage.Error = error
            }
        }
        
        condition.lock()
        task.resume()
        condition.wait()
        condition.unlock()
        
        return responseMessage
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
        var Body: Data?
        
        init(url: URL, queries: [URLQueryItem], headers: [String: String], method: HTTPMethods, body: Data?) {
            Url = url
            Queries = queries
            Headers = headers
            Method = method
            Body = body
        }
    }
    
    class HTTPResponseMessage {
        var Status: HTTPResponseStatus?
        var Headers: [String: String]?
        var Body: Data?
        var Error: Error?
        
        init(status: HTTPResponseStatus, headers: [String: String], body: Data?) {
            Status = status
            Headers = headers
            Body = body
        }
        
        init() {
        }
        
        func IsSuccessfulStatus() -> Bool {
            if let status = Status {
                switch status.Status {
                case .OK:
                    return true
                default:
                    return false
                }
            } else {
                return false
            }
        }
        
        func ReadResponseAsString(encoding: String.Encoding = .utf8) -> String {
            if let data = Body {
                return String(data: data, encoding: .utf8)!
            } else {
                return ""
            }
        }
    }
    
    enum HTTPStatuses: String {
        case OK
        case NotAcceptable
        case NotFound
        case InternalServerError
        case Unexpected
    }
    
    class HTTPResponseStatus {
        var StatusCode: String
        var Status: HTTPStatuses
        
        init(_ code: String) {
            StatusCode = code
            
            switch code {
            case "200":
                Status = .OK
            case "406":
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



