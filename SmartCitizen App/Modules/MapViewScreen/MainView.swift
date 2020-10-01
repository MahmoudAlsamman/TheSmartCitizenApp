//
//  MainView.swift
//  SmartCitizen App
//
//  Created by Mahmoud Alsamman on 23/09/2020.
//

import UIKit
import MapKit

class MainView: UIView {
    
    private var isLayedout: Bool = false
    var delegate: MKMapViewDelegate? {
        get {
            return mapView.delegate
        }
        set {
            mapView.delegate = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard !isLayedout else { return }
        setupLayout()
        isLayedout = true
    }
    
    private func setupLayout() {
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        addSubview(mapView)
    }
    
    private func setupConstraints() {
        setupMapViewConstraints()
    }
    
    private func setupMapViewConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
     private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.register(StationAnnotationView.self, forAnnotationViewWithReuseIdentifier: "StationAnnotation")
        mapView.register(MapClusterAnnotationView.self, forAnnotationViewWithReuseIdentifier: "cluster")
        mapView.mapType = .standard
        mapView.showsUserLocation = true
        return mapView
    }()
    
    func addPinsOnMapFor(_ devices: [Station]) {
        mapView.removeAnnotations(mapView.annotations)
        let pins = devices.map {MapPin(title: $0.name!, id: $0.id!, latidude: $0.latitude!, longtude: $0.longitude!)}
        mapView.addAnnotations(pins)
    }
    
    func centerOnLoction(_ coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.6, longitudeDelta: 0.6)
        let region = MKCoordinateRegion.init(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
}
