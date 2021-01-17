//
//  GetAllDevicesRquest.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 12/12/2020.
//

struct GetAllKitsRequest: APIRequest {
    
    typealias Response = [SmartKit]
    
    var path: String {
        "/v0/devices/world_map"
    }
}
