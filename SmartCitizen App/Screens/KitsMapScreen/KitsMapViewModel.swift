//
//  KitsMapViewModel.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 11/12/2020.
//

final class KitsMapViewModel {
    
    // MARK: - Properties
    
    var selectedKit: SmartKit?
    private var devices: [SmartKit] = []

    // MARK: - Dependencies
    
    let factory: KitDetailsViewControllerFactory
    private let locationManager: LocationManager
    private let apiClient: OnlineKitsAPIService & KitDetailsAPIService
    
    // MARK: - Initializer
    
    init(
        apiClient: APIClient,
        locationManager: LocationManager,
        factory: KitDetailsViewControllerFactory
    ) {
        self.apiClient = apiClient
        self.locationManager = locationManager
        self.factory = factory
    }
    
    // MARK: - Methods
    
    func getAnnotationsForOnlineDevices(completion: @escaping (Result<[MapPin], Error>) -> Void) {
        apiClient.getOnlineKits { result in
            switch result {
            case .success(let onlineDevices):
                self.devices = onlineDevices
                let annotations = onlineDevices.map {
                    MapPin(
                        id: $0.id,
                        latitude: $0.latitude ?? 0.0,
                        longitude: $0.longitude ?? 0.0
                    )
                }
                completion(.success(annotations))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getKitDetails(kitId: Int, completion: @escaping (Result<SmartKit,Error>) -> Void) {
        apiClient.getKitDetails(kidId: kitId) { [weak self] result in
            switch result {
            case .success(let kit):
                self?.selectedKit = kit
                completion(.success(kit))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func deviceWithId(_ id: Int) -> SmartKit? {
        devices.first(where: {$0.id == id})
    }
}
