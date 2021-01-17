//
//  Sensor.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 24/09/2020.
//

struct KitData: Codable {
    let sensors: [KitSensor]
    let location: KitLocation
    
    func getReadingsFor(sensorType: KitSensor.SensorType) -> String? {
        let sensor = sensors.first(where: { $0.sensorType == sensorType })
        return sensor?.currentRead
    }
}
