//
//  APIClient.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 24/09/2020.
//

import Foundation


class APIClient {
    
    let session = URLSession.shared
    
    func fetch<T: Codable>(_ router: Router, completion: @escaping (Result<T, Error>) -> Void) {
        
        let request = prepareURLRequestFor(router)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("[🤦🏽‍♂️] - Error: \(error)")
                completion(.failure(error))
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(APIClientError.HTTPResponse))
                print("[🤦🏽‍♂️] - Error: \(APIClientError.HTTPResponse)")
                return
            }
            
            guard let data = data else {
                completion(.failure(APIClientError.noDataRetrieved))
                print("[🤦🏽‍♂️] - Error: \(APIClientError.noDataRetrieved)")
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(APIClientError.badHTTPResponse(statusCode: httpResponse.statusCode)))
                print("[🤦🏽‍♂️] - Error: \(APIClientError.badHTTPResponse(statusCode: httpResponse.statusCode))")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            
            if let result = try? jsonDecoder.decode(T.self, from: data) {
                completion(.success(result))
            } else {
                completion(.failure(APIClientError.decoding))
                print("[🤦🏽‍♂️] - Error: \(APIClientError.decoding)")
            }
        }
        
        task.resume()
    }
    
    private func prepareURLRequestFor(_ router: Router) -> URLRequest {
        var urlComponents        = URLComponents()
        urlComponents.scheme     = router.scheme
        urlComponents.host       = router.host
        urlComponents.path       = router.path
        urlComponents.queryItems = router.parameters
        guard let url = urlComponents.url else {fatalError("[🤦🏽‍♂️] - Bad URL")}
        
        var request = URLRequest(url: url)
        request.httpMethod = router.method
        
        return request
    }
}
