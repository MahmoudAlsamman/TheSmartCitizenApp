//
//  KitDetailsViewController.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 02/01/2021.
//

import UIKit

final class KitDetailsViewController: CodeViewController<KitDetailsView> {
    
    private let viewModel: KitDetailsViewModel
    
    init(customView: KitDetailsView? = nil,viewModel: KitDetailsViewModel) {
        self.viewModel = viewModel
        super.init(customView: customView ?? KitDetailsView())
        self.customView.setCollectionViewDataSourceTo(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViewWithKitDetails()
    }
    
    func updateViewWithKitDetails() {
        let kit = viewModel.kit
        customView.updateViewWith(kit: kit)
        customView.setPinOnMapFor(kit)
    }
}

// MARK: - UICollectionViewDataSource

extension KitDetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.sensors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: SensorDetailsCellView.identifier, for: indexPath) as! SensorDetailsCellView
        view.setupCellWith(sensorDetails: viewModel.sensors[indexPath.item])
        return view
    }
}

