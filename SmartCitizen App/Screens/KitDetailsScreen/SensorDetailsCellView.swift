//
//  SensorDetailsCellView.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 17/01/2021.
//

import UIKit

class SensorDetailsCellView: UICollectionViewCell {
    
    // MARK: - Constants
    
    static let identifier = "SensorDetailsCellView"
    
    // MARK: - Public points of contact
    
    func setupCellWith(sensorDetails: KitSensor) {
        sensorValue.text = sensorDetails.currentRead
        sensorName.text = sensorDetails.name
        sensorImageView.image = UIImage(named: "\(sensorDetails.id)")
    }
    
    // MARK: - View properties
    
    private let sensorName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sensorValue: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sensorImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProperties() {
        contentView.backgroundColor = UIColor(named: "cell")
        contentView.layer.cornerRadius = 16
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowRadius = 10
    }
    
    // MARK: - Views hierarchy
    
    private func setupLayout() {
        setupHierarchy()
        setupConstraints()
        setupProperties()
    }
    
    private func setupHierarchy() {
        contentView.addSubviews(sensorName,sensorImageView, sensorValue)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                sensorName.topAnchor.constraint(equalTo: topAnchor),
                sensorName.bottomAnchor.constraint(equalTo: sensorImageView.topAnchor),
                sensorName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
                sensorName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
                
                sensorValue.topAnchor.constraint(equalTo: sensorImageView.bottomAnchor),
                sensorValue.bottomAnchor.constraint(equalTo: bottomAnchor),
                sensorValue.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
                sensorValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
        
                sensorImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                sensorImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                sensorImageView.heightAnchor.constraint(equalToConstant: 50),
                sensorImageView.widthAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
}
