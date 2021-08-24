//
//  KitDetailsView.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 02/01/2021.
//

import UIKit
import MapKit

final class KitDetailsView: CodeView {
    
    // MARK: - Public points of contact
    
    func setPinOnMapFor(_ kit: SmartKit) {
        let pin = MapPin(id: kit.id, latitude: kit.data?.location.latitude ?? 0.0, longitude: kit.data?.location.longitude ?? 0.0)
        mapView.addAnnotation(pin)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion.init(center: pin.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func updateViewWith(kit: SmartKit) {
        kitNameLabel.text = kit.name
        addressLabel.text = kit.data?.location.address
    }
    
    func setCollectionViewDataSourceTo(_ dataSource: UICollectionViewDataSource) {
        sensorsCollectionView.dataSource = dataSource
    }
    
    
    // MARK: - Views properties
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.layer.cornerRadius = 20
        mapView.isUserInteractionEnabled = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    private let kitNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()
    
    private lazy var sensorsCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        cv.register(SensorDetailsCellView.self, forCellWithReuseIdentifier: SensorDetailsCellView.identifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.delegate = self
        return cv
    }()
}


//MARK: - View hierarchy
extension KitDetailsView: ViewSetupable {
    func setupViewHierarchy() {
        addSubviews(mapView, kitNameLabel, addressLabel, sensorsCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                mapView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
                mapView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
                mapView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
                mapView.heightAnchor.constraint(equalToConstant: 200),
                
                kitNameLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 16),
                kitNameLabel.leadingAnchor.constraint(equalTo: mapView.leadingAnchor),
                kitNameLabel.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
                
                addressLabel.topAnchor.constraint(equalTo: kitNameLabel.bottomAnchor, constant: 5),
                addressLabel.leadingAnchor.constraint(equalTo: mapView.leadingAnchor),
                addressLabel.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
                
                sensorsCollectionView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 30),
                sensorsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                sensorsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                sensorsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        )
    }
    
    func setupProperties() {
        backgroundColor =  UIColor(named: "cell")
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension KitDetailsView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.bounds.width / 2) - 50
        let cellSize = CGSize(width: cellWidth, height:  cellWidth)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
}
