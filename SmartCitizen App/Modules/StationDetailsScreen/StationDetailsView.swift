//
//  StationDetailsView.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 30/09/2020.
//

import UIKit

class StationDetailsView: UIView {
    
    private var isLayedout: Bool = false
    
    var delegate: UICollectionViewDelegate? {
        get {
            return detailsCollectionView.delegate
        }
        set {
            detailsCollectionView.delegate = newValue
        }
    }
    
    var dataSource: UICollectionViewDataSource? {
        get {
            return detailsCollectionView.dataSource
        }
        set {
            detailsCollectionView.dataSource = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard !isLayedout else { return }
        backgroundColor = .systemGray6
        setupLayout()
        isLayedout = true
    }
    
    private func setupLayout() {
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        addSubview(detailsCollectionView)
    }
    
    private func setupConstraints() {
        detailsCollectionViewConstraints()
    }
    
    private func detailsCollectionViewConstraints() {
        detailsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsCollectionView.topAnchor.constraint(equalTo: centerYAnchor),
            detailsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            detailsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private var cvLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var detailsCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: cvLayout)
        cv.register(SensorDetailsCellView.self, forCellWithReuseIdentifier: "SensorDetails")
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        return cv
    }()
    
    func reloadData() {
        detailsCollectionView.reloadData()
    }
}
