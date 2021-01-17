//
//  Device.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 24/09/2020.
//

import Foundation

struct SmartKit: Codable {
    
    let id: Int
    let name: String?
    let description: String?
    let latitude: Double?
    let longitude: Double?
    let systemTags: [String]
    let data: KitData?
    private let lastReadTime: Date
    
    var lastRead: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM"
        return formatter.string(from: lastReadTime)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, latitude, longitude, data
        case systemTags = "system_tags"
        case lastReadTime = "last_reading_at"
    }
}
