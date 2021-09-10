//
//  LaunchpadsEndPoints.swift
//  rs_task11_common
//
//  Created by Dzmitry Semenovich on 9.09.21.
//

import Foundation

public enum LaunchpadsEndPoints {
    case getAllLaunchpads
    case getLaunchpad(id: String)
}

extension LaunchpadsEndPoints: EndPointProtocol {
    public var baseUrl : URL {
        guard let url = URL(string: "https://api.spacexdata.com/v4/launchpads") else { fatalError("baseURL could not be configured.")}
                return url
    }
    
    public var path : String {
        switch self {
        case .getAllLaunchpads:
            return ""
        case .getLaunchpad(id: let id):
            return "\(id)"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .getAllLaunchpads:
            return .get
        case .getLaunchpad:
            return .get
        }
    }
}
