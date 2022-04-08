//
//  GetAllDevicesRquest.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 12/12/2020.
//

struct GetAllKitsRequest: APIRequest {
    
    typealias Response = GetAllKitsResponse
    
    var path: String {
        "/v0/devices/world_map"
    }
}

struct GetAllKitsResponse: APIResponse {
    let kits: [SmartKit]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        kits = try container.decode([SmartKit].self)
    }
}
