//
//  Sensor.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 24/09/2020.
//

import UIKit

struct Sensors: Codable {
    let sensors: [Sensor]
}

struct Sensor: Codable {
    let id: SensorName
    let name: String
    let description: String
    let unit: String
    let value: Double
    let previousValue: Double

    enum CodingKeys: String, CodingKey {
        case id, name, description, unit, value
        case previousValue = "prev_value"
    }
    
    func getSensorName() -> String {
        switch id {
        case .tvoc:
            return "TVOC"
        case .eco2:
            return "eCO2"
        case .lux:
            return "LUX"
        case .battery:
            return "Battery"
        case .noise:
            return "Noise"
        case .barometer:
            return "Barometer"
        case .pm1:
            return "PM1"
        case .pm10:
            return "PM10"
        case .pm2:
            return "PM 2.5"
        case .humidity:
            return "Humidity"
        case .temp:
            return "Temp"
        }
    }
    
}

enum SensorName: Int, Codable {
    case tvoc = 113
    case eco2 = 112
    case lux = 14
    case battery = 10
    case noise = 53
    case barometer = 58
    case pm1 = 89
    case pm10 = 88
    case pm2 = 87
    case humidity = 56
    case temp = 55
}
