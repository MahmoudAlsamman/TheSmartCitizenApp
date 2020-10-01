//
//  MapPin.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 29/09/2020.
//

import MapKit

class MapPin: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let id: Int
    
    init(title: String, id: Int, latidude: Double, longtude: Double) {
        self.title = title
        self.id = id
        self.coordinate = CLLocationCoordinate2D(latitude: latidude, longitude: longtude)
    }
}
