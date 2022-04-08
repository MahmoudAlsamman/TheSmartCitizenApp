//
//  KitDetailsAPIService.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 02/01/2021.
//

protocol KitDetailsAPIService {
    func getKitDetails(kidId: Int, completion: @escaping (Result<SmartKit, Error>) -> Void)
}

extension APIClient: KitDetailsAPIService {
    func getKitDetails(kidId: Int, completion: @escaping (Result<SmartKit, Error>) -> Void) {
        let request = GetKitDetailsRequest(kitId: kidId)
        perform(request) { result in
            switch result {
            case .success(let response):
                completion(.success(response.kit))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
