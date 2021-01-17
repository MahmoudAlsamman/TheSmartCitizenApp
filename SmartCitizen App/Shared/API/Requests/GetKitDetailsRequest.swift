//
//  File.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 02/01/2021.
//

struct GetKitDetailsRequest: APIRequest {
    
    typealias Response = SmartKit
    
    let kitId: Int
    
    var path: String {
        "/v0/devices/\(kitId)"
    }
}
