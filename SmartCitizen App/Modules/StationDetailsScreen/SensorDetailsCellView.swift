//
//  SensorDetailsCellView.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 02/10/2020.
//

import UIKit

class SensorDetailsCellView: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(named: "cell")
        setupLayout()
    }
    
    private func setupLayout() {
        setupHierarchy()
        setupConstraints()
        setupCellCorners()
    }
    
    private func setupHierarchy() {
        addSubview(sensorName)
        addSubview(sensorImageView)
        addSubview(sensorValue)
    }
    
    private func setupConstraints() {
        sensorValueConstraints()
        sensorImageViewConstraints()
        sensorNameConstraints()
    }
    
    private func sensorValueConstraints() {
        sensorValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sensorValue.topAnchor.constraint(equalTo: sensorImageView.bottomAnchor),
            sensorValue.bottomAnchor.constraint(equalTo: bottomAnchor),
            sensorValue.leadingAnchor.constraint(equalTo: leadingAnchor),
            sensorValue.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func sensorNameConstraints() {
        sensorName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sensorName.topAnchor.constraint(equalTo: topAnchor),
            sensorName.bottomAnchor.constraint(equalTo: sensorImageView.topAnchor),
            sensorName.leadingAnchor.constraint(equalTo: leadingAnchor),
            sensorName.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func sensorImageViewConstraints() {
        sensorImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sensorImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            sensorImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            sensorImageView.heightAnchor.constraint(equalToConstant: 50),
            sensorImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
  
    private let sensorValue: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    private let sensorName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.text = "Temp"
        return label
    }()
    
    private let sensorImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.image = UIImage(named: "sun")
        return image
    }()
    
    private func setupCellCorners() {
        contentView.layer.cornerRadius = (bounds.width * 0.30)
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellWith(sensorDetails: Sensor) {
        sensorValue.text = "\(sensorDetails.value)"
        sensorName.text = sensorDetails.name
    }
}
