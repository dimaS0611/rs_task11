//
//  EndPointProtocol.swift
//  rs_task11_common
//
//  Created by Dzmitry Semenovich on 9.09.21.
//

import Foundation

public protocol EndPointProtocol {
    var baseUrl : URL {get}
    var path : String {get}
    var httpMethod: HTTPMethod {get}
}

public enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
    case post = "POST"
}
