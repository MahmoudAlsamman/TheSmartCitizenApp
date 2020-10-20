//
//  StationDetailsViewController.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 30/09/2020.
//

import UIKit

class StationDetailsViewController: UIViewController {
    
    var stationView = StationDetailsView()
    let apiClient = APIClient()
    var sensors = [Sensor]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        stationView.delegate = self
        stationView.dataSource = self        
    }
    
    override func loadView() {
        super.loadView()
        view = stationView
    }

    init(for deviceId: Int) {
        super.init(nibName: nil, bundle: nil)
        self.getSensorsData(for: deviceId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getSensorsData(for deviceID: Int) {
        apiClient.fetch(.deviceDetailsWithID(deviceID)) { [weak self] (result: APIResponse.OneDevice) in
            switch result {
            case .success(let device):
                self?.sensors = (device.data?.sensors)!
                self?.stationView.reloadData()
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}

extension StationDetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sensors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: "SensorDetails", for: indexPath) as! SensorDetailsCellView
        view.setupCellWith(sensorDetails: sensors[indexPath.item])
        return view
    }
}

extension StationDetailsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let cellSize = CGSize(width: width/4 - 20, height: width/3)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}
