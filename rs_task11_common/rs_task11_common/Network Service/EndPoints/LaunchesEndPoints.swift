//
//  LaunchesEndPoints.swift
//  rs_task11_common
//
//  Created by Dzmitry Semenovich on 9.09.21.
//

import Foundation

public enum LaunchesEndPoints {
    case getAllLaunches
    case getLatestLaunch
    case getNextLaunch
    case getLaunch(id: String)
    case getAllPastLaunch
    case getUpcomingLaunches
}

extension LaunchesEndPoints: EndPointProtocol {
    public var baseUrl: URL {
        guard let url = URL(string: "https://api.spacexdata.com/v5/launches") else { fatalError("baseURL could not be configured.")}
                return url
    }
    
    public var path: String {
        switch self {
        case .getAllLaunches:
            return ""
        case .getLatestLaunch:
            return "/latest"
        case .getNextLaunch:
            return "/next"
        case .getLaunch(id: let id):
            return "/\(id)"
        case .getAllPastLaunch:
            return "/past"
        case .getUpcomingLaunches:
            return "/upcoming"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .getAllLaunches:
            return .get
        case .getLatestLaunch:
            return .get
        case .getNextLaunch:
            return .get
        case .getLaunch(id: let id):
            return .get
        case .getAllPastLaunch:
            return .get
        case .getUpcomingLaunches:
            return .get
        }
    }
}
