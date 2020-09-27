//
//  Device.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 24/09/2020.
//

import Foundation

struct Device: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let latitude: Double?
    let longitude: Double?
    let city: String?
    let countryId: String?
    let systemTags: [String]?
    let userTags: [String]? //whatch out
    let lastReadTime: Date?
    let data: Sensors?
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, latitude, longitude, city
        case countryId = "country_code"
        case systemTags = "system_tags"
        case userTags = "user_tags"
        case lastReadTime = "last_reading_at"
        case data
    }
}
