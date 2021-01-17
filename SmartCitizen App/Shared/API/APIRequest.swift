//
//  APIRequest.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 11/12/2020.
//

import Foundation

protocol APIRequest: Encodable {
    
    associatedtype Response: Decodable
    
    var httpMethod: String { get }
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    func build() -> URLRequest
}

extension APIRequest {
    var httpMethod: String { "GET" }
    var scheme: String { "https" }
    var host: String { "api.smartcitizen.me" }
    var queryItems: [URLQueryItem]? { nil }
    
    func build() -> URLRequest {
        var urlComponents        = URLComponents()
        urlComponents.scheme     = scheme
        urlComponents.host       = host
        urlComponents.path       = path
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else { fatalError("[🤦🏽‍♂️] - Bad URL") }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        return urlRequest
    }
}
