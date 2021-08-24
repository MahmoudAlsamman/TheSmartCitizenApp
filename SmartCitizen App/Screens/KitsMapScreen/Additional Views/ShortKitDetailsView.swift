//
//  DeviceMiniDetailsView.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 19/12/2020.
//

import UIKit
import Lottie

final class ShortKitDetailsView: CodeView {
    
    // MARK: - Public points of contact
    
    func updateViewWith(smartKit: SmartKit) {
        nameLabel.text = smartKit.name
        deviceIdLabel.text = "Station ID: \(smartKit.id)"
        addressLabel.text = smartKit.data?.location.address
        deviceFirstTagLabel.text = smartKit.systemTags[0]
        deviceSecondTagLabel.text = smartKit.systemTags[1]
        lastUpdateLabel.text = "Last read: \(smartKit.lastRead)"
        temperatureLabel.text = smartKit.data?.getReadingsFor(sensorType: .temp)
        batteryLabel.text = smartKit.data?.getReadingsFor(sensorType: .battery)
    }
    
    // MARK: - View properties
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .label
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let lastUpdateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    private let deviceFirstTagLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.backgroundColor = .systemOrange
        return label
    }()
    
    private let deviceSecondTagLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.backgroundColor = .systemOrange
        return label
    }()
    
    private let deviceIdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    private let batteryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    private let temperatureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "thermometer")
        return imageView
    }()
    
    private let batteryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "battery")
        return imageView
    }()
    
    private let animationView: AnimationView = {
        let animation = AnimationView(name: "enviroment")
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.play()
        animation.loopMode = .loop
        animation.backgroundBehavior = .pauseAndRestore
        animation.contentMode = .scaleAspectFit
        return animation
    }()
}

extension ShortKitDetailsView: ViewSetupable {
    func setupViewHierarchy() {
        addSubviews(
            nameLabel,
            lastUpdateLabel,
            addressLabel,
            deviceIdLabel,
            deviceFirstTagLabel,
            deviceSecondTagLabel,
            animationView,
            temperatureImageView,
            temperatureLabel,
            batteryImageView,
            batteryLabel
        )
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                animationView.centerYAnchor.constraint(equalTo: centerYAnchor),
                animationView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                animationView.heightAnchor.constraint(equalToConstant: 125),
                animationView.widthAnchor.constraint(equalToConstant: 125),
                
                nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
                nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                nameLabel.trailingAnchor.constraint(equalTo: animationView.leadingAnchor),
                
                addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
                addressLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                addressLabel.trailingAnchor.constraint(equalTo: animationView.leadingAnchor),
                
                deviceIdLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 4),
                deviceIdLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                
                lastUpdateLabel.topAnchor.constraint(equalTo: deviceIdLabel.bottomAnchor, constant: 4),
                lastUpdateLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                
                deviceFirstTagLabel.topAnchor.constraint(equalTo: lastUpdateLabel.bottomAnchor, constant: 8),
                deviceFirstTagLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                deviceFirstTagLabel.heightAnchor.constraint(equalToConstant: 24),
                
                deviceSecondTagLabel.centerYAnchor.constraint(equalTo: deviceFirstTagLabel.centerYAnchor),
                deviceSecondTagLabel.leadingAnchor.constraint(equalTo: deviceFirstTagLabel.trailingAnchor, constant: 8),
                
                temperatureImageView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                temperatureImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
                temperatureImageView.heightAnchor.constraint(equalToConstant: 20),
                temperatureImageView.widthAnchor.constraint(equalToConstant: 20),
                
                temperatureLabel.centerYAnchor.constraint(equalTo: temperatureImageView.centerYAnchor),
                temperatureLabel.leadingAnchor.constraint(equalTo: temperatureImageView.trailingAnchor, constant: 4),
                
                batteryImageView.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 20),
                batteryImageView.centerYAnchor.constraint(equalTo: temperatureImageView.centerYAnchor),
                batteryImageView.heightAnchor.constraint(equalToConstant: 20),
                batteryImageView.widthAnchor.constraint(equalToConstant: 20),
                
                batteryLabel.centerYAnchor.constraint(equalTo: batteryImageView.centerYAnchor),
                batteryLabel.leadingAnchor.constraint(equalTo: batteryImageView.trailingAnchor, constant: 4)
            ]
        )
    }
    
    func setupProperties() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor =  UIColor(named: "cell")
        layer.cornerRadius = 30
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 20
    }
}
