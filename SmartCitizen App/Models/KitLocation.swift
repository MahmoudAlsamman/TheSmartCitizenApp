//
//  KitLocation.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 02/01/2021.
//

struct KitLocation: Codable {
    
    let latitude: Double
    let longitude: Double
    private let city: String?
    private let countryCode: String?
    
    var address: String? {
        "\(city ?? "") \(countryCode ?? "")"
    }
}
