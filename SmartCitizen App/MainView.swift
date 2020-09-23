//
//  MainView.swift
//  SmartCitizen App
//
//  Created by Mahmoud Alsamman on 23/09/2020.
//

import UIKit
import MapKit

class MainView: UIView {
    
    private var isLayedOut: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard !isLayedOut else { return }
        setupLayout()
        isLayedOut = true
    }
    
    private func setupLayout() {
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        
    }
    
    private func setupConstraints() {
        
    }
}
