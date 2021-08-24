//
//  KitAnnotationView.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 27/09/2020.
//
import UIKit
import MapKit

final class KitAnnotationView: MKAnnotationView {
    
    /// Annotation Identifier.
    static let identifier = "KitAnnotationView"
    
    private let pinImage = UIImage(named: "station")
    
    override public var annotation: MKAnnotation? {
        willSet {
            if (newValue as? MapPin) != nil {
                setupAnnotationView()
            }
        }
    }
    
    private func setupAnnotationView() {
        clusteringIdentifier = "cluster"
        renderAnnotationImage()
    }
    
    private func renderAnnotationImage() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 40, height: 40))
        let renderedImage = renderer.image { _ in
            /// roundedRect with blue color
            UIColor(red: 52/255, green: 131/255, blue: 223/255, alpha: 0.50).setFill()
            UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 40, height: 40), cornerRadius: 7).fill()
            /// roundedRect with orange color
            UIColor.systemOrange.setFill()
            UIBezierPath(roundedRect: CGRect(x: 5, y: 5, width: 30, height: 30), cornerRadius: 7).fill()
            let rect = CGRect(x: 10, y: 10, width: 20, height: 20)
            pinImage!.draw(in: rect)
        }
        
        image = renderedImage
    }
}
