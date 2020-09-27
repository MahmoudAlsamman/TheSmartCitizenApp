//
//  Router.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 26/09/2020.
//

import Foundation

enum Router {
    
    case allWorldDevices
    case devicesNearby(latidude: Double, longtude: Double)
    case deviceDetailsWithID(_ id: Int)
    
    
    var scheme: String {
        switch self {
        case .deviceDetailsWithID, .devicesNearby, .allWorldDevices:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .deviceDetailsWithID, .devicesNearby, .allWorldDevices:
            return "api.smartcitizen.me"
        }
    }
    
    var path: String {
        switch self {
        case .deviceDetailsWithID(let id):
            return "/v0/devices/\(id)"
        case .devicesNearby:
            return "/v0/devices/"
        case .allWorldDevices:
            return "/v0/devices/world_map"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .deviceDetailsWithID, .allWorldDevices:
            return nil
        case .devicesNearby(let latidude, let longtude):
            
            return [URLQueryItem(name: "near", value: "\(latidude),\(longtude)")]
        }
    }
    
    var method: String {
        switch self {
        case .deviceDetailsWithID, .devicesNearby, .allWorldDevices:
            return "GET"
        }
    }
}
