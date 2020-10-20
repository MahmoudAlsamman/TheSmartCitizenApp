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
    
    func displayStationDetails(for id: Int) {
        let stationVC = StationDetailsViewController(for: id)
        self.addChild(stationVC)
        mainView.addChildView(stationVC.view)
        stationVC.didMove(toParent: self)
    }
    
    func removeChildControllers() {
        children.forEach {
            $0.willMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
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
        if view.annotation is MapPin {
            let station = view.annotation as! MapPin
            let id = station.id
            displayStationDetails(for: id)
        } else if view.annotation is MKClusterAnnotation {
            mainView.centerOnLoction(view.annotation!.coordinate)
        } else {
            mapView.deselectAnnotation(view.annotation, animated: false)
            
        }
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        if view.annotation is MapPin {
            removeChildControllers()
        }
    }
}
