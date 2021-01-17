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
        perform(request, completion: completion)
    }
}
