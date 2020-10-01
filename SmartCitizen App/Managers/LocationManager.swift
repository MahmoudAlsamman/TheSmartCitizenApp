//
//  LocationManager.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 23/09/2020.
//
//
import CoreLocation
import MapKit

protocol LocationManagerDelegate: AnyObject {
    func didUpdate(_ location:CLLocation)
}

class LocationManager: NSObject {
    
    private var locationManager: CLLocationManager?
    weak var delegate: LocationManagerDelegate?
   
    override init() {
        super.init()
        setupLocationManager()
    }
    
   private func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse,.authorizedAlways:
            locationManager?.startUpdatingLocation()
        case .notDetermined:
            locationManager?.requestWhenInUseAuthorization()
        case .denied:
            print("error - Denied")
        case .restricted:
            print("error - Restricted")
        @unknown default:
            fatalError()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            delegate?.didUpdate(location)
        }
    }
}
