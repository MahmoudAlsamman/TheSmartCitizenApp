//
//  File.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 02/01/2021.
//

struct GetKitDetailsRequest: APIRequest {
    
    typealias Response = GetKitDetailsResponse
    
    let kitId: Int
    
    var path: String {
        "/v0/devices/\(kitId)"
    }
}

struct GetKitDetailsResponse: APIResponse {
    let kit: SmartKit
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        kit = try container.decode(SmartKit.self)
    }
}
