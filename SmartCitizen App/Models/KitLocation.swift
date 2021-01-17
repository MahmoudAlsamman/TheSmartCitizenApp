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
    private let countryId: String?
    
    var address: String? {
        "\(city ?? "") \(countryId ?? "")"
    }
  
    enum CodingKeys: String, CodingKey {
        case latitude, longitude, city
        case countryId = "country_code"
    }
}
