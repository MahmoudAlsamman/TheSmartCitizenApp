//
//  KitClusterAnnotationView.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 01/10/2020.
//

import MapKit
import UIKit

class KitClusterAnnotationView: MKAnnotationView {
    
    static let identifier = "KitClusterAnnotationView"
    
    override var annotation: MKAnnotation? {
        willSet {
            if let cluster = newValue as? MKClusterAnnotation {
                let count = cluster.memberAnnotations.count
                renderViewWithNumberOfCulsters(count)
            }
        }
    }
    
    private func renderViewWithNumberOfCulsters(_ number: Int) {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 40, height: 40))
        let renderedImage = renderer.image { _ in
            UIColor(red: 52/255, green: 131/255, blue: 223/255, alpha: 0.50).setFill()
            UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 40, height: 40), cornerRadius: 7).fill()
            
            UIColor.systemOrange.setFill()
            UIBezierPath(roundedRect: CGRect(x: 5, y: 5, width: 30, height: 30), cornerRadius: 7).fill()
            
            let attributes = [
                NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)
            ]
            let text = "\(number)"
            let size = text.size(withAttributes: attributes)
            let rect = CGRect(x: 20 - size.width/2, y: 20 - size.height/2, width: 20, height: 20)
            text.draw(in: rect, withAttributes: attributes)
        }
        
        image = renderedImage
    }
    
}

