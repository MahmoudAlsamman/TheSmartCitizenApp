//
//  KitSensor.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 02/01/2021.
//

struct KitSensor: Codable {
    
    let name: String
    let previousValue: Float
    let id: Int
    private  let unit: String
    private let value: Double
    
    var currentRead: String {
        "\(value) \(unit)"
    }
    
    var sensorType: SensorType? {
        return SensorType(rawValue: id)
    }
    
    enum SensorType: Int {
        case tvoc      = 113
        case eco2      = 112
        case lux       = 14
        case battery   = 10
        case noise     = 53
        case barometer = 58
        case pm1       = 89
        case pm10      = 88
        case pm2       = 87
        case humidity  = 56
        case temp      = 55
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, unit, value
        case previousValue = "prev_value"
    }
}
