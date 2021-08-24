//
//  APIClient.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 24/09/2020.
//

import Foundation

final class APIClient {
    
    // MARK: - Dependencies
    
    var session = URLSession.shared
    
    // MARK: - Methods
    
    func perform<Request: APIRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void) {
        
        let request = request.build()
        
        let task = session.dataTask(with: request) { (data, response, error) in
            var finalResult: Result<Request.Response, Error>
            
            if let error = error {
                print("[🤦🏽‍♂️] - Error: \(error)")
                finalResult = .failure(error)
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                finalResult = .failure(APIError.HTTPResponse)
                print("[🤦🏽‍♂️] - Error: \(APIError.HTTPResponse)")
                return
            }
            
            guard let data = data else {
                finalResult = .failure(APIError.noDataRetrieved)
                print("[🤦🏽‍♂️] - Error: \(APIError.noDataRetrieved)")
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                finalResult = .failure(APIError.badHTTPResponse(statusCode: httpResponse.statusCode))
                print("[🤦🏽‍♂️] - Error: \(APIError.badHTTPResponse(statusCode: httpResponse.statusCode))")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            
            if let result = try? jsonDecoder.decode(Request.Response.self, from: data) {
                finalResult = .success(result)
            } else {
                finalResult = .failure(APIError.decoding)
                print("[🤦🏽‍♂️] - Error: \(APIError.decoding)")
            }
            
            DispatchQueue.main.async {
                completion(finalResult)
            }
        }
        
        task.resume()
    }
}
