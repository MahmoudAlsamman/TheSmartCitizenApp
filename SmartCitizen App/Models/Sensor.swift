//
//  Sensor.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 24/09/2020.
//

import Foundation

struct Sensors: Codable {
    let sensors: [Sensor]
}

struct Sensor: Codable {
    let id: Int
    let name: String
    let description: String
    let unit: String
    let value: Double
    let previousValue: Double

    enum CodingKeys: String, CodingKey {
        case id, name, description, unit, value
        case previousValue = "prev_value"
    }
}
