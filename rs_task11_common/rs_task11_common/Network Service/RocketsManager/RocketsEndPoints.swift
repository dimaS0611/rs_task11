//
//  RocketsEndPoints.swift
//  rs_task11_common
//
//  Created by Dzmitry Semenovich on 9.09.21.
//

import Foundation

enum RocketsEndPoints {
    case getAllRockets
    case getRocket(id: String)
}

extension RocketsEndPoints: EndPointProtocol {

    var baseUrl: URL {
        guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else { fatalError("baseURL could not be configured.")}
                return url
    }
    
    var path: String {
        switch self {
        case .getAllRockets:
            return ""
        case .getRocket(id: let id):
            return "/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getAllRockets:
            return .get
        case .getRocket:
            return .get
        }
    }
}



