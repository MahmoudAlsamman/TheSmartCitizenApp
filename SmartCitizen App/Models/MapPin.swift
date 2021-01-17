//
//  MapPin.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 29/09/2020.
//

import MapKit

class MapPin: NSObject, MKAnnotation {
    let id: Int
    let coordinate: CLLocationCoordinate2D
    
    init(id: Int, latitude: Double, longitude: Double) {
        self.id = id
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
