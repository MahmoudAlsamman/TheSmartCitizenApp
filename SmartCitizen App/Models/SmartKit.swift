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
    let lastReadingAt: Date?
}
