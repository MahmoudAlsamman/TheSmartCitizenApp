//
//  LocationManager.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 23/09/2020.
//
//
import CoreLocation
import MapKit

class LocationManager: NSObject {
    
    var locationManager = CLLocationManager()
    var location: CLLocation?
    
    override init() {
        super.init()
        setupLocationManager()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if #available(iOS 14.0, *) {
            switch manager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("here")
            case .denied:
                print("here2")
            case .authorizedAlways, .authorizedWhenInUse:
                locationManager.startUpdatingLocation()
            @unknown default:
                break
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        self.location = location
    }
}
