//
//  OnlineDevicesAPIService.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 02/01/2021.
//

protocol OnlineKitsAPIService {
    func getOnlineKits(completion: @escaping (Result<[SmartKit], Error>) -> Void)
}

extension APIClient: OnlineKitsAPIService {
    func getOnlineKits(completion: @escaping (Result<[SmartKit], Error>) -> Void) {
        let request = GetAllKitsRequest()
        perform(request) { result in
            switch result {
                case .success(let kits):
                    let onlineKits = kits.filter {
                        $0.systemTags.contains("online") &&
                            $0.longitude != nil &&
                            $0.latitude != nil
                    }
                    completion(.success(onlineKits))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
