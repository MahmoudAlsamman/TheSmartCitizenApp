//
//  APIResponse.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 27/09/2020.
//

import Foundation

protocol APIResponse: Codable {
    static var decoder: JSONDecoder { get }
}

extension APIResponse {
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
