//
//  MainViewController.swift
//  SmartCitizen App
//
//  Created by Mahmoud Alsamman on 23/09/2020.
//

import UIKit
import CoreLocation
import MapKit

class MainViewController: UIViewController {
    
    var locationManager = LocationManager()
    var mainView = MainView()
    let apiClient = APIClient()
    var stations = [Station]()
    var isLocationCentered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        mainView.delegate = self
        loadAllOnlineDevices()
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    func loadAllOnlineDevices() {
        apiClient.fetch(.allWorldDevices) { [weak self] (result: APIResponse.MultipleDevices) in
            switch result {
            case .success(let devices):
                let onlineStations = devices.filter {$0.systemTags!.contains("online")}
                self?.stations = onlineStations
                self?.mainView.addPinsOnMapFor(onlineStations)
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}

extension MainViewController: LocationManagerDelegate {
    func didUpdate(_ location: CLLocation) {
        if !isLocationCentered {
            isLocationCentered = true
//            mainView.centerOnLoction(location.coordinate)
        }
    }
}

extension MainViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        switch annotation {
        case is MKUserLocation:
            return nil
        case is MapPin:
            let view = mapView.dequeueReusableAnnotationView(withIdentifier: "StationAnnotation") as? StationAnnotationView
            return view
        case is MKClusterAnnotation:
            let view = mapView.dequeueReusableAnnotationView(withIdentifier: "cluster") as? MapClusterAnnotationView
            return view
        default:
            return nil
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if view.annotation is MapPin  {
            navigationController?.pushViewController(StationDetailsViewController(), animated: true)
        } else if view.annotation is MKClusterAnnotation {
            mainView.centerOnLoction(view.annotation!.coordinate)
        }
    }
}
