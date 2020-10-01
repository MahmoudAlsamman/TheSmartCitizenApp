//
//  DeviceAnnotationView.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 27/09/2020.
//
import UIKit
import MapKit

class StationAnnotationView: MKAnnotationView {
    
    private let pinImage = UIImage(named: "station")
    
    override open var annotation: MKAnnotation? {
        willSet {
            if (newValue as? MapPin) != nil {
                setupAnnotationView()
            }
        }
    }
    
    private func setupAnnotationView() {
        clusteringIdentifier = "cluster"
        displayPriority = .defaultHigh
        renderAnnotationImage()
    }
    
    private func renderAnnotationImage() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 40, height: 40))
        image = renderer.image { _ in
            UIColor(red: 52/255, green: 131/255, blue: 223/255, alpha: 0.50).setFill()
            UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 40, height: 40)).fill()
            UIColor.systemOrange.setFill()
            UIBezierPath(ovalIn: CGRect(x: 8, y: 8, width: 24, height: 24)).fill()
            let rect = CGRect(x: 10, y: 10, width: 20, height: 20)
            pinImage!.draw(in: rect)
        }
    }
}
