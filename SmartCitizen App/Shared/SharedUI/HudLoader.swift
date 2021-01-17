//
//  HudLoader.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 02/01/2021.
//

import UIKit
import Lottie

class HUDLoader: CodeView {

    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = .systemOrange
        spinner.startAnimating()
        spinner.backgroundColor = #colorLiteral(red: 0.5871760249, green: 0.7297004461, blue: 0.8930240273, alpha: 0.8)
        spinner.layer.cornerRadius = 8
        return spinner
    }()
}

extension HUDLoader: ViewSetupable {
    func setupViewHierarchy() {
        addSubview(spinner)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
                spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
                spinner.heightAnchor.constraint(equalToConstant: 60),
                spinner.widthAnchor.constraint(equalToConstant: 60)
            ]
        )
    }
    
    func setupProperties() {
        isUserInteractionEnabled = false
    }
}

extension UIView {
    
    func showHudLoader() {
        let loader = HUDLoader()
        addSubview(loader)
        loader.frame = bounds
        
        loader.alpha = 0
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            loader.alpha = 1
        }
    }
    
    func hideHudLoader() {
        for hud in subviews.compactMap({ $0 as? HUDLoader }) {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                hud.alpha = 0
            } completion: { _ in
                hud.removeFromSuperview()
            }
        }
    }
}
