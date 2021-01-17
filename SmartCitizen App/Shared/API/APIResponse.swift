//
//  APIResponse.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 27/09/2020.
//

import Foundation

protocol APIResponse: Decodable {
    static var decoder: JSONDecoder { get }
}

extension APIResponse {
    static var decoder: JSONDecoder {
        return JSONDecoder()
    }
}
