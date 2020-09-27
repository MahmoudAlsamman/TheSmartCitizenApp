//
//  MainViewController.swift
//  SmartCitizen App
//
//  Created by Mahmoud Alsamman on 23/09/2020.
//

import UIKit
import CoreLocation
import MapKit

class MainViewController: UIViewController, CLLocationManagerDelegate {

    var mainView = MainView()
    var locationManager = LocationManager()
    let api = APIClient()

    typealias Devicex = Result<[Device], Error>

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        centreOnUserLoction()
        
        api.fetch(.allWorldDevices) { (result: Devicex) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    print(data.filter {$0.systemTags!.contains("online")})
                }
            case .failure(_):
                print("error")
            }
            
        }
    }

    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    func centreOnUserLoction() {
        if let location = locationManager.locationManager.location {
            let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion.init(center: location.coordinate, span: span)
            self.mainView.mapView.setRegion(region, animated: true)
        }
            
        }

}

