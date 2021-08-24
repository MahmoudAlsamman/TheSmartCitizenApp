//
//  KitsMapView.swift
//  SmartCitizen App
//
//  Created by Mahmoud Alsamman on 23/09/2020.
//

import MapKit

final class KitsMapView: CodeView {
    
    // MARK: - Public points of contact
    
    var shortDetailsViewOnTap: (() -> Void)?
    
    func hideShortKitDetailsView() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.shortKitDetailsView.alpha = 0
            self.shortDetailsBottomConstraint?.constant = 0
            self.layoutIfNeeded()
        }
    }
    
    func showShortKitDetailsView() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn) {
            self.shortDetailsBottomConstraint?.constant = -270
            self.shortKitDetailsView.alpha = 1
            self.layoutIfNeeded()
        }
    }
    
    func setMapViewDeleagateTo(_ delegate: MKMapViewDelegate) {
        mapView.delegate = delegate
    }
    
    func showKitsAnnotations(_ annotations: [MapPin]) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(annotations)
    }
    
    func centerOnLoction(_ coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)
        let region = MKCoordinateRegion.init(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func updateViewWith(kit: SmartKit) {
        shortKitDetailsView.updateViewWith(smartKit: kit)
    }
    
    // MARK: - Private properties
    
    private var shortDetailsBottomConstraint: NSLayoutConstraint?
    
    // MARK: - View properties
    
    private lazy var shortKitDetailsView: ShortKitDetailsView = {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        let view = ShortKitDetailsView()
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.register(KitAnnotationView.self, forAnnotationViewWithReuseIdentifier: KitAnnotationView.identifier)
        mapView.register(KitClusterAnnotationView.self, forAnnotationViewWithReuseIdentifier: KitClusterAnnotationView.identifier)
        mapView.showsUserLocation = true
        return mapView
    }()
    
    private lazy var locationButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "location.fill"), for: .normal)
        button.tintColor = .systemOrange
        button.backgroundColor = UIColor(named: "cell")
        button.layer.cornerRadius = 20
        button.layer.shadowRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        return button
    }()
    
    // MARK: - Private functions
    
    @objc private func viewTapped() {
        shortDetailsViewOnTap?()
    }
    
    @objc private func locationButtonTapped() {
        mapView.setCenter(mapView.userLocation.coordinate, animated: true)
    }
}

// MARK: - Views hierarchy

extension KitsMapView: ViewSetupable {
    func setupViewHierarchy() {
        addSubviews(mapView)
        mapView.addSubviews(
            locationButton,
            shortKitDetailsView
        )
    }
    
    func setupConstraints() {
        shortDetailsBottomConstraint = shortKitDetailsView.topAnchor.constraint(equalTo: bottomAnchor)
        shortDetailsBottomConstraint?.isActive = true
        
        NSLayoutConstraint.activate(
            [
                mapView.topAnchor.constraint(equalTo: topAnchor),
                mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
                mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
                mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                locationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                locationButton.bottomAnchor.constraint(equalTo: shortKitDetailsView.topAnchor, constant: -50),
                locationButton.heightAnchor.constraint(equalToConstant: 48),
                locationButton.widthAnchor.constraint(equalToConstant: 48),
                
                shortKitDetailsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                shortKitDetailsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                shortKitDetailsView.heightAnchor.constraint(equalToConstant: 200),
            ]
        )
    }
}
