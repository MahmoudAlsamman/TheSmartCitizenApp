//
//  MainViewController.swift
//  SmartCitizen App
//
//  Created by Mahmoud Alsamman on 23/09/2020.
//

import MapKit

final class KitsMapViewController: CodeViewController<KitsMapView> {
        
    private let viewModel: KitsMapViewModel
    
    init(customView: KitsMapView? = nil, viewModel: KitsMapViewModel) {
        self.viewModel = viewModel
        super.init(customView: customView ?? KitsMapView())
        self.customView.setMapViewDeleagateTo(self)
        setupCallbacks()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showOnlineDevices()
    }
    
   
	private func showOnlineDevices() {
        customView.showHudLoader()
		viewModel.getAnnotationsForOnlineDevices { [weak self] result in
            self?.customView.hideHudLoader()
			switch result {
				case .success(let annotations):
                    self?.customView.showKitsAnnotations(annotations)
				case .failure(let error):
					print(error)
			}
		}
	}
    
    private func setupCallbacks() {
        customView.shortDetailsViewOnTap = { [weak self] in
            guard let self = self else { return }
            guard let selectedKit = self.viewModel.selectedKit else { return }
            let vc = self.viewModel.factory.makeKitDetailsViewController(kit: selectedKit)
            self.present(vc, animated: true)
        }
    }
    
    func getKitDetailsFor(_ id: Int) {
        viewModel.getKitDetails(kitId: id) { [weak self] result in
            switch result {
            case .success(let kit):
                self?.customView.updateViewWith(kit: kit)
                self?.customView.showShortKitDetailsView()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - MapView Delegates

extension KitsMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        switch annotation {
        case is MKUserLocation:
            return nil
        case is MapPin:
			let view = mapView.dequeueReusableAnnotationView(withIdentifier: KitAnnotationView.identifier) as? KitAnnotationView
            return view
        case is MKClusterAnnotation:
			let view = mapView.dequeueReusableAnnotationView(withIdentifier: KitClusterAnnotationView.identifier) as? KitClusterAnnotationView
            return view
        default:
            return nil
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if view.annotation is MapPin {
            let station = view.annotation as! MapPin
            getKitDetailsFor(station.id)
            mapView.setCenter(station.coordinate, animated: true)
        } else if view.annotation is MKClusterAnnotation {
            mapView.setCenter(view.annotation!.coordinate, animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        if view.annotation is MapPin {
            customView.hideShortKitDetailsView()
        }
    }
}
