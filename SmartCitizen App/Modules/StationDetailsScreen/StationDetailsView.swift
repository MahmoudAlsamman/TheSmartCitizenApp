//
//  StationDetailsView.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 30/09/2020.
//

import UIKit

class StationDetailsView: UIView {
    
    private var isLayedout: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard !isLayedout else { return }
        backgroundColor = .red
        setupLayout()
        isLayedout = true
    }
    
    private func setupLayout() {
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {

    }
    
    private func setupConstraints() {
        setupMapViewConstraints()
    }
    
    private func setupMapViewConstraints() {
        NSLayoutConstraint.activate([
           
        ])
    }
    
}
