//
//  NetworkRequest.swift
//  rs_task11_common
//
//  Created by Dzmitry Semenovich on 10.09.21.
//

import Foundation

public protocol NetworkRouter {
    associatedtype EndPoint: EndPointProtocol
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
