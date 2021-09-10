//
//  Router.swift
//  rs_task11_common
//
//  Created by Dzmitry Semenovich on 10.09.21.
//

import Foundation

public class Router<EndPoint: EndPointProtocol>: NetworkRouter {
    public var task: URLSessionTask?
    
    public func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try buildRequest(from: route)
            switch request.httpMethod {
            case HTTPMethod.post.rawValue, HTTPMethod.put.rawValue:
                task = session.uploadTask(with: request, from: request.httpBody,
                                          completionHandler: { data, response, error in
                                            completion(data, response, error)
                                          })
            default:
                task = session.dataTask(with: request, completionHandler: { data, response, error in
                    completion(data, response, error)
                })
            }
        } catch {
            completion(nil, nil, error)
        }
        task?.resume()
    }
    
    public func cancel() {
        task?.cancel()
    }
    
    public func buildRequest(from route: EndPoint) throws -> URLRequest {
        
        var request = URLRequest(url: route.baseUrl.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 30.0)
        
        request.httpMethod = route.httpMethod.rawValue
        #if DEBUG
        print("CURL \n\(request.curlString)")
        #endif
        return request
    }
}
