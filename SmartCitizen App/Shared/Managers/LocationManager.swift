//
//  LocationManager.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 23/09/2020.
//
//

import CoreLocation

protocol LocationManagerDelegate: AnyObject {
    func didUpdate(_ location:CLLocation)
}

class LocationManager: NSObject {
    
    private var manager: CLLocationManager
    weak var delegate: LocationManagerDelegate?
   
    override init() {
        self.manager = CLLocationManager()
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse,.authorizedAlways:
            manager.startUpdatingLocation()
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
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
